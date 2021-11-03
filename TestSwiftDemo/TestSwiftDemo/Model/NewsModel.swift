//
//  NewsModel.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/2.
//

import Foundation
import UIKit


class NewsModel: NSObject {
	
	@objc var  replyCount : Int = 0
	@objc var title: String = ""
	@objc var source = ""
	@objc var imgsrc = ""
	
	
	
	init(dict: [String : Any]) {
		
		super.init()
		setValuesForKeys(dict)
		//self.setValuesForKeys(dict)
	}
	
	@objc public init(_ replyCount: Int, _ title: String, _ source: String, _ imgsrc: String) {
		
		self.replyCount = replyCount
		self.title = title
		self.source = source
		self.imgsrc = imgsrc
	}
	
	override class func setValue(_ value: Any?, forUndefinedKey key: String) {
		print("_______func___")
	}
	
	
}
