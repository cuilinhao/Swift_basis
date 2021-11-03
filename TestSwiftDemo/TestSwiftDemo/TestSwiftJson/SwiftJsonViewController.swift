//
//  SwiftJsonViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/3.
//

import UIKit
import SwiftyJSON
import Alamofire


class SwiftJsonViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		   
		   // Do any additional setup after loading the view.
		   view.backgroundColor = .systemPurple
		   
		   //loadData()
		  // test()
		test1()
	}
}

extension SwiftJsonViewController {
	
	
	func test() {
		let jsonStr = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
		
		
		
		if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
			
			//使用JSONSerializationSwiftyJSON解析
			//比如我们要取第一条联系人的第一个电话号码，每个级别都判断就很麻烦，代码如下
			
			if let userArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [[String : AnyObject]], let phones = userArray?[0]["phones"] as? [[String: AnyObject]], let number = phones[0]["number"] as? String {
				
				//找到电话号码
				print("第一个联系人的第一个电话号码:", number)
				
			}
			
		}
		
		
		if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
			
			//使用swiftJson 进行解析
			let json = try! JSON(data: jsonData)
			
			//Call can throw, but it is not marked with 'try' and the error is not handled
			//let json = JSON(data: jsonData)
			//https://www.cnblogs.com/sundaysme/articles/10602656.html
			if let number = json[0]["phones"][0]["number"].string {
				//第一个人的联系电话: 123456
				print("第一个人的联系电话:", number)
				
			}
			
			
		}
	}
	   
	   
   }

/** 注释
 
 HandyJSON # 解析MODEL
 SwiftyJSON # 解析网络数据的jsonstring
 Alamofire # 解析网络数据(封装)
 
 */
extension SwiftJsonViewController {
	//http://c.m.163.com/nc/article/list/T1348649079062/0-20.html
	fileprivate func loadData() {
		NetworkTools.requestData(urlString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result) in
			print(result)
			
			//1. 将any 类型转成字典模型
			guard let resultDic = result as? [String: Any] else {
				return
			}
			
			print("______\(result)")
			
			//2. 根据 key取出内容
			guard let dataArray = resultDic["T1348649079062"] as? [[String : Any]] else {
				return
			}
			
			//3,遍历字典，将字典转成模型对象
		}
	}
}

/** 注释
 if var urlRequest = try? endpoint.urlRequest() {
	 urlRequest.timeoutInterval = 20
	 closure(.success(urlRequest))
 } else {
	 closure(.failure(MoyaError.requestMapping(endpoint.url)))
 }
 
 
 guard let completion = completion else { return }
 guard let returnData = try? result.value?.mapModel(ResponseData<T>.self) else {
	 completion(nil)
	 return
 }
 completion(returnData.data?.returnData)
 
 
 */
//MARK:- 获取网络数据
extension SwiftJsonViewController {
	
	func test1() {
		let url = URL(string: "https://www.cnblogs.com/sundaysme/articles/10602656.html")
		
		let request = URLRequest(url: url!)
		
		let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
			
			if error != nil {
				print(error! ?? "error")
			}else {
				//codeTest
				
				/** let json = try! JSON(data: data!)
				 if let number = json[0]["phone"][0]["number"].string {
					 print("第一个联系人的第一个电话号码:", number)
				 }
				 */
				if let json1 = try? JSON(data: data!) {
					
					if let number = json1[0]["phone"][0]["number"].string {
						print("第一个联系人的第一个电话号码:", number)
					}
					
				}else {
					print(">>>>>>>>>__fail")
				}
				
			}
		}
		
		dataTask.resume()
		
	}
	
}

//MARK:- 与Alamofire 结合使用

extension SwiftJsonViewController {
	
	func test2() throws {
		
	let url = URL(string: "")
		
		Alamofire.request(url!).validate().responseJSON { response in
			
			switch response.result.isSuccess {
				
			case true:
				
				if let value = response.result.value {
					
					if let json = try? JSON(value) {
						
						if let number = json[0]["phones"][0]["number"].string {
							
							print("第一个联系人的第一个电话:", number)
							
						}
						
					}else {
						print(">>>>>error")
					}
				}
				
			case false:
				print(response.result.error ?? "404")
			}
		}
		
	}
}

