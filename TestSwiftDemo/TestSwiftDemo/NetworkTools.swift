//
//  NetworkTools.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/2.
//

import Foundation
import UIKit
import Alamofire

enum MethodType {
	case get
	case post
}

/** 注释
Alamofire.request(.GET, url).validate().responseJSON { response in
	switch response.result {
	case .Success(let value):
		let json = JSON(value)
		print("JSON: \(json)")
	case .Failure(let error):
		print(error)
	}

print(response.request)  // 原始的URL请求
	print(response.response) // HTTP URL响应
	print(response.data)     // 服务器返回的数据
	print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据

}

*/

class NetworkTools {
	
	class func requestData(urlString: String, type: MethodType, parameters: [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ()) {
		
		let method = type == .get ? HTTPMethod.get : HTTPMethod.post

		Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
			
			//1.校验是否有结果 https://www.cnblogs.com/jukaiit/p/9283498.html
			
			
			guard let result = response.result.value else {
				debugPrint(response.error ?? "error>>>")
				return
			}
			
			//将结果回调出去
			finishedCallback(result)
			
		}
		
		
	}
	
}
