//
//  AutoTestVC.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/21.
//

import UIKit

class AutoTestVC: UIViewController {
	
	var centerView: UIView!
	var centerWidth: NSLayoutConstraint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemGray
		
		self.centerView = UIView.init()
		view.addSubview(self.centerView)
		
		self.centerView.backgroundColor = UIColor.red
		
		self.centerView.translatesAutoresizingMaskIntoConstraints = false
		self.centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
		self.centerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
		
		self.centerWidth = self.centerView.widthAnchor.constraint(equalToConstant: 120)
		
		self.centerWidth.isActive = true
		self.centerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
		
		
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		self.centerWidth.constant = 250
		
		//不加动画也可以
//		weak var weakSelf = self
//		UIView.animate(withDuration: 0.35, animations: {
//			weakSelf?.centerView.superview?.layoutIfNeeded()
//		}) { (finished) in
//
//		}
		
	}
	
}
