//
//  AutoLayoutVCViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/21.
//

import UIKit

/**
 typedef NS_ENUM(NSInteger, NSLayoutRelation) {
 NSLayoutRelationLessThanOrEqual = -1,          //小于等于
 NSLayoutRelationEqual = 0,                     //等于
 NSLayoutRelationGreaterThanOrEqual = 1,        //大于等于
 };
 typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
 NSLayoutAttributeLeft = 1,                     //左侧
 NSLayoutAttributeRight,                        //右侧
 NSLayoutAttributeTop,                          //上方
 NSLayoutAttributeBottom,                       //下方
 NSLayoutAttributeLeading,                      //首部
 NSLayoutAttributeTrailing,                     //尾部
 NSLayoutAttributeWidth,                        //宽度
 NSLayoutAttributeHeight,                       //高度
 NSLayoutAttributeCenterX,                      //X轴中心
 NSLayoutAttributeCenterY,                      //Y轴中心
 NSLayoutAttributeBaseline,                     //文本底标线
 NSLayoutAttributeNotAnAttribute = 0            //没有属性
 };
 NSLayoutAttributeLeft/NSLayoutAttributeRight 和NSLayoutAttributeLeading/NSLayoutAttributeTrailing的区别是left/right永远是指左右，而leading/trailing在某些从右至左习惯的地区会变成，leading是右边，trailing是左边。
 
 */
class AutoLayoutVCViewController: UIViewController {

	
	//private var _placeholderLabelConstraints: [NSLayoutConstraint] = []
	private var lab5Constraints : [NSLayoutConstraint] = []
	
	private var lab5TopConstraints : NSLayoutConstraint?
	
	lazy var lab1: UILabel = {
		
		let lab1 = UILabel()
		lab1.backgroundColor = UIColor.systemPink
		lab1.text = "lab1"
		lab1.textColor = .white
		lab1.translatesAutoresizingMaskIntoConstraints = false
		return lab1
	}()
	
	
	lazy var lab2: UILabel = {
		
		let lab2 = UILabel()
		lab2.backgroundColor = UIColor.systemGreen
		lab2.text = "lab2"
		lab2.textColor = .white
		
		lab2.translatesAutoresizingMaskIntoConstraints = false
		
		return lab2
	}()
	
	lazy var lab3: UILabel = {
		
		let lab3 = UILabel()
		lab3.backgroundColor = .systemRed
		lab3.text = "lab3"
		lab3.textColor = .white
		
		lab3.translatesAutoresizingMaskIntoConstraints = false
		
		return lab3
	}()
	
	lazy var lab4: UILabel = {
		let lab4 = UILabel()
		
		lab4.backgroundColor = .systemBlue
		lab4.text = "lab4"
		lab4.textColor = .white
		
		lab4.translatesAutoresizingMaskIntoConstraints = false
		
		return lab4
	}()
	
	lazy var lab5: UILabel = {
		let lab5 = UILabel()
		
		lab5.backgroundColor = .systemBlue
		lab5.text = "lab5"
		lab5.textColor = .white
		lab5.translatesAutoresizingMaskIntoConstraints = false
		return lab5
	}()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .lightGray
		self.title = "Autolayout"
		
		//test1()
		
		view.addSubview(lab1)
		view.addSubview(lab2)
		view.addSubview(lab3)
		view.addSubview(lab4)
		view.addSubview(lab5)
		
		/***
		 NSLayoutConstraint.activate([
			 imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
			 imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
			 imageView.widthAnchor.constraint(equalToConstant: 40),
			 imageView.heightAnchor.constraint(equalToConstant: 40)
			 ])
		 */
		
		NSLayoutConstraint.activate([

			lab1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			lab1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			lab1.widthAnchor.constraint(equalToConstant: 100),
			lab1.heightAnchor.constraint(equalToConstant: 80)
		])

		
		
		//左上为正,右下为负
		NSLayoutConstraint.activate([
		
			lab2.topAnchor.constraint(equalTo: lab1.topAnchor, constant: 0),
			//右
			lab2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			lab2.widthAnchor.constraint(equalToConstant: 100),
			lab2.heightAnchor.constraint(equalToConstant: 80)
		])
		
		NSLayoutConstraint.activate([
		
			lab3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			lab3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			
			lab3.widthAnchor.constraint(equalToConstant: 100),
			lab3.heightAnchor.constraint(equalToConstant: 80),
		])
		
		
		NSLayoutConstraint.activate([
		
			lab4.leadingAnchor.constraint(equalTo: lab1.leadingAnchor, constant: 0),
			//左上为正,右下为负
			//lab4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
			lab4.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
			lab4.widthAnchor.constraint(equalToConstant: 100),
			lab4.heightAnchor.constraint(equalToConstant: 80)
		])
		
		/*
		NSLayoutConstraint.activate([

			lab5.topAnchor.constraint(equalTo: lab4.topAnchor, constant: 0),
			//lab5.bottomAnchor.constraint(equalTo: lab4.bottomAnchor, constant: 0),
			lab5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			lab5.widthAnchor.constraint(equalToConstant: 100),
			lab5.heightAnchor.constraint(equalToConstant: 90)
		])
		*/
		
		lab5Constraints = [
			
			//报错
			//lab5TopConstraints = lab5.topAnchor.constraint(equalTo: lab4.topAnchor, constant: 0),
			
			lab5.topAnchor.constraint(equalTo: lab4.topAnchor, constant: 0),
			lab5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			lab5.widthAnchor.constraint(equalToConstant: 100),
			lab5.heightAnchor.constraint(equalToConstant: 90)
		]
		
		NSLayoutConstraint.activate(lab5Constraints)
		
    }
}

//MARK: - 更新布局 更新某一个布局
//https://blog.csdn.net/longshihua/article/details/80094401

extension AutoLayoutVCViewController {
	
	func testUpdate() {
		//更新lab5 的某一个布局
		
		NSLayoutConstraint.activate([
			//lab5.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
			//lab5.topAnchor.constraint(equalTo: lab4.topAnchor, constant: -90),
		])
		
		NSLayoutConstraint.deactivate([
		])
		
		//lab5.constraints
		
		for cc in lab5.constraints {
			
			if cc .isKind(of: NSLayoutConstraint.self) {
				print("11234")
			}
			print("_____\(cc)")
		}
		
		
		
	}
	
	
}


//MARK: - 更新布局(重写整个布局)
extension AutoLayoutVCViewController {
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
		testUpdate()
		
		
		return
		
		/**
		 
		 self.removeConstraints(self._placeholderLabelConstraints)
		 
		 self._placeholderLabelConstraints = [
			 self._placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			 self._placeholderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: inset.left),
			 self._placeholderLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -(inset.left + inset.right)),
		 ]
		 NSLayoutConstraint.activate(self._placeholderLabelConstraints)
		 
		 */
		
		lab5.removeConstraints(lab5Constraints)
		
		//更新布局
		NSLayoutConstraint.activate([
			lab5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			lab5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			lab5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			lab5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
		])
		
		self.present(ViewController(), animated: true, completion: nil)
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
		 1. 右下为正 2. 坐上为负 不对
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
