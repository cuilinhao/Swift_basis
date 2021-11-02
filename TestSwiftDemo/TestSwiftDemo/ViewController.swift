//
//  ViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/2.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

	lazy var newsModel = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	
		view.backgroundColor = .systemGreen
		
		loadData()
		
	}

}

//MARK:- 网路数据

extension ViewController {
	//http://c.m.163.com/nc/article/list/T1348649079062/0-20.html
	fileprivate func loadData() {
		NetworkTools.requestData(urlString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result) in
			print(result)
			
			//1. 将any 类型转成字典模型
			guard let resultDic = result as? [String: Any] else {
				return
			}
			
			//2. 根据 key取出内容
			guard let dataArray = resultDic["T1348649079062"] as? [[String : Any]] else {
				return
			}
			//3,遍历字典，将字典转成模型对象
			
			for dict in dataArray {
				//self.newsModel.append(NewsModel(dict :dict))
			}
			//4. 刷新表格
			
		}
	}
}

