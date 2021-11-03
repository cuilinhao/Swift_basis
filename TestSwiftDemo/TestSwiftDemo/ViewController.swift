//
//  ViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/2.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate {
	
	lazy var newsModel = [NewsModel]()
	
	lazy var tableView :UITableView = {
		
		let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
		
		tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cellID")
		
		
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	
		view.backgroundColor = .systemGreen
		self.title = "网易新闻"
		self.view.addSubview(tableView)
		loadData()
	}
	

}

extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.newsModel.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! NewsTableViewCell
		
		
		//cell.textLabel?.text = String(indexPath.row)
		
		//cell.contentView.backgroundColor = .systemPurple
		//if indexPath.row % 2 == 0 {
			//cell.contentView.backgroundColor = .systemGreen
		//}
		
		cell.newsModel = self.newsModel[indexPath.row]
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if indexPath.row == 0 {
			
			let vc = SwiftJsonViewController()
			self.navigationController?.pushViewController(vc, animated: true)
		}else {
			let vc = HandyJSONViewController()
			self.navigationController?.pushViewController(vc, animated: true)
		}
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
				//setvalue的时候，没有写所有属性，会闪退
				#warning("setvalue的时候，没有写所有属性，会闪退")
				//self.newsModel.append(NewsModel(dict: dict))
			}
			
			
			//codeTest
			let mode1 = NewsModel(20, "遍历字典，将字典转成模型对象遍历字典，将字典转成模型对象", "网易新闻", "http://cms-bucket.ws.126.net/2021/1102/bf7c318cj00r1xpll00bqc000s600e3c.jpg")
			self.newsModel.append(mode1)
			
			let mode2 = NewsModel(3420, "testshfj 杀伐决断乐山大佛是多久发货款式都思考发货的看法re", "网易新闻1", "https://www.tietu8.com/uploads/allimg/c210327/161D323G220-OcR.jpg")
			self.newsModel.append(mode2)
			
			let mode3 = NewsModel(5520, "testt", "网易新闻2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUyWpo64qvKZf4PVOKun-QAOu8DrswLFLwkQ&usqp=CAU")
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			
			let mode4 = NewsModel(5320, "hello", "网易新闻3", "http://cms-bucket.ws.126.net/2021/1102/336900bcp00r1x43m005mc0009c0070c.png")
			self.newsModel.append(mode4)
			
			
			//4. 刷新表格
			self.tableView.reloadData()
			
		}
	}
}

