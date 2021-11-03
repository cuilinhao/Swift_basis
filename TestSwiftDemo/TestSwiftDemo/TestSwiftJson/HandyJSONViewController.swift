//
//  HandyJSONViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/3.
//

import UIKit
import HandyJSON


//https://www.jianshu.com/p/939d33a626a0

class Person: HandyJSON {
	var doubleOptional: Double?
	var stringImplicitlyUnwrapped: String = ""
	var int:Int?
	var name: String?
	
	required init(){} // 必须实现一个空的初始化方法
}

class Component: HandyJSON {
	var num: Int?
	var comp1: SubComponent?
	var comp2: SubComponent?
	
	required init(){}
}

class ComponentArr: HandyJSON {
	var num: Int?
	var compArr: [SubComponent]?
	
	required init(){}
}

class SubComponent: HandyJSON {
	var aInt: Int?
	var aString: String = ""
	
	required init(){}
}



//let jsonString = "{\"cat_id\":12345,\"name\":\"Kitty\",\"friend\":{\"id\":54321,\"name\":\"Lily\"}}"

class Cat: HandyJSON {
	var id: Int64!
	var name: String!
	var friendName: String?

	required init() {}
	
	func mapping(mapper: HelpingMapper) {
		// 把id转换为json数据里的key：cat_id，friendName转化为读json数据里的friend字典中的name字段。
		mapper <<<
			self.id <-- "cat_id"
	
		mapper <<<
			self.friendName <-- "friend.name"
	}
}


class HandyJSONViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		view.backgroundColor = .systemPink
		
		print(">>>>>>HandyJSONViewController>>>>>>>")
		
		parse1()
		//包含对象嵌套的解析
		parse_includeObj()
		//包含数组对象的解析
		parse_includeArr()
		//自定义对象
		parse_includeCustomeObj()
		//把字典转成对象
		parse_includeDict()
		
    }
    

}


//MARK:- json字符串转对应model的
//简单的解析，包括model中有json里不存在的，json中也有model里不存在的内容
extension HandyJSONViewController {
	
	func parse1() {
		
		//简单的解析
		let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1,\"msg\":\"world\"}"

		if let p: Person = Person.deserialize(from: jsonString) {
			
			/** 注释
			 1.1
			 hello
			 1
			 */
			print(p.doubleOptional!)
			print(p.stringImplicitlyUnwrapped)
			print(p.int!)
			
		}else {
			print("解析失败")
		}
	}
	
}

//MARK:- 包含对象嵌套的解析
extension HandyJSONViewController {
	
	func parse_includeObj() {
		
		let jsonString = "{\"num\":12345,\"comp1\":{\"aInt\":1,\"aString\":\"aaaaa\"},\"comp2\":{\"aInt\":2,\"aString\":\"bbbbb\"}}"
		
		if let mainCom: Component = Component.deserialize(from: jsonString)  {
			
			print(mainCom.num!)
		}
	}
	
}

//MARK:- 包含数组对象的解析
extension HandyJSONViewController {
	
	func parse_includeArr() {
		
		let jsonString = "{\"num\":12345,\"comp1\":{\"aInt\":1,\"aString\":\"aaaaa\"},\"comp2\":{\"aInt\":2,\"aString\":\"bbbbb\"}}"

		if let mainCom: ComponentArr = ComponentArr.deserialize(from: jsonString) {
			
			print(mainCom.num!)
			// mainCom.compArr 是nil
//			for com in mainCom.compArr! {
//				print(com.aInt!)
//				print(com.aString)
//			}
		}
	}
	
}

//MARK:-  把字典转成对象
extension HandyJSONViewController {
	
	
	
	func parse_includeDict() {
		
		print("+++++++++++")
		
		var dict = [String : Any]()
		dict["doubleOptional"] = 1.1
		dict["stringImplicitlyUnwrapped"] = "hello"
		dict["int"] = 1
		
		if let p: Person = Person.deserialize(from: dict) {
			
			print(p.doubleOptional!)
			print(p.stringImplicitlyUnwrapped)
			print(p.int!)
			print(p.name)//字典里没有对应的值，为nil
			
		}
	}
	
}

//MARK:- 包含自定义解析：当model的属性名和json里的对应不上的时候，model里实现mapping函数去对应key。
extension HandyJSONViewController {
	
	func parse_includeCustomeObj() {
		
		let jsonString = "{\"cat_id\":12345,\"name\":\"Kitty\",\"parent\":\"Tom/Lily\",\"friend\":{\"id\":54321,\"name\":\"Lily\"}}"

		if let cat : Cat = Cat.deserialize(from: jsonString) {
			print(cat)
		}
	}
	
}
