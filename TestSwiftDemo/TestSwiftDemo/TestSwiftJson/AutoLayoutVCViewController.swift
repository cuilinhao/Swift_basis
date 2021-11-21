//
//  AutoLayoutVCViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/21.
//

import UIKit

class AutoLayoutVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		view.backgroundColor = .systemPink
		self.title = "Autolayout"
		
		test1()
		
    }
}

extension AutoLayoutVCViewController {
	
	func test1() {
		
		let lab1 = UILabel()
		lab1.backgroundColor = UIColor.systemGreen
		
		lab1.text = "12321iu343"
		
		let lab3 = UILabel()
		lab3.backgroundColor = UIColor.systemGreen
		lab3.text = "12321iu343"
		
		let vv = UIStackView()
		vv.spacing = 30
		
		vv.distribution = .equalSpacing
		vv.addArrangedSubview(lab1)
		vv.addArrangedSubview(lab3)
		
		/** AutoLayout 坐标系 是按照UI坐标轴进行设定的
		 1. 右下为正
		 2. 坐上为负
		 */
		view.addSubview(vv)
		
		NSLayoutConstraint.activate([
			//vv.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			
			//设置间距
			//  vv.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -200),
			
			//位置交换,布局会改变
			self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: vv.topAnchor, constant: -200),
			
			vv.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			//vv.bottomAnchor.constraint(equalTo: self.view.topAnchor),
			//vv.topAnchor.constraint(equalTo: self.view.topAnchor)
			vv.heightAnchor.constraint(equalToConstant: 200),
			//vv.widthAnchor.constraint(equalToConstant: 200)
			
		])
		vv.translatesAutoresizingMaskIntoConstraints = false
		
		vv.backgroundColor = .white
		
	}
}
