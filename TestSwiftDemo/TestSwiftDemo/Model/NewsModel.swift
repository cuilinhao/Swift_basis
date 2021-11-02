//
//  NewsModel.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/2.
//

import Foundation
import UIKit

class NewsModel {
	
	var  replyCount : Int = 0
	var title: String = ""
	var source = ""
	var imgsrc = ""
	
	
	
	
	init(dict: [String : Any]?) {
		
		super.init
		
		setValuesForKeys(dict)
	}
	
	
}
