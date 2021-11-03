//
//  SwiftJsonViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/3.
//

import UIKit

class SwiftJsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		view.backgroundColor = .systemPurple
		
		loadData()
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

