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
		
		
//		let vc = AutoLayoutVCViewController()
//		self.navigationController?.pushViewController(vc, animated: true)
//		
//		return
		
		
		switch indexPath.row {
		case 0:
			let vc = SwiftJsonViewController()
			self.navigationController?.pushViewController(vc, animated: true)
		case 1:
			let vc = HandyJSONViewController()
			self.navigationController?.pushViewController(vc, animated: true)
		case 2:
			let vc = AutoLayoutVCViewController()
			self.navigationController?.pushViewController(vc, animated: true)
		default:
			let vc = AutoTestVC()
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
				self.newsModel.append(NewsModel(dict: dict))
			}
			
			
			//codeTest
			let mode1 = NewsModel(20, "遍历字典，将字典转成模型对象遍历字典，将字典转成模型对象", "网易新闻1", "http://nimg.ws.126.net/?url=http://dingyue.ws.126.net/2020/0929/619df265p00qhe2cb0179d200u00140g008x00bw.png&thumbnail=650x2147483647&quality=80&type=jpg")
			self.newsModel.append(mode1)
			
			let mode2 = NewsModel(3420, "testshfj 杀伐决断乐山大佛是多久发货款式都思考发货的看法re", "网易新闻11", "http://img.duoziwang.com/2020/01/04021042912841.jpg")
			self.newsModel.append(mode2)
			
			let mode3 = NewsModel(5520, "testt", "网易新闻21", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUyWpo64qvKZf4PVOKun-QAOu8DrswLFLwkQ&usqp=CAU")
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			self.newsModel.append(mode3)
			
			let mode4 = NewsModel(5320, "hello", "网易新闻3", "http://cms-bucket.ws.126.net/2021/1102/336900bcp00r1x43m005mc0009c0070c.png")
			self.newsModel.append(mode4)
			
			
			self.newsModel.insert(mode1, at: 0)
			self.newsModel.insert(mode1, at: 0)
			//self.newsModel.insert(mode1, at: 0)
			
			//4. 刷新表格
			self.tableView.reloadData()
			
		}
	}
}

