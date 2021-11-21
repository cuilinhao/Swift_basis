//
//  NewsTableViewCell.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 on 2021/11/3.
//

import UIKit
import SnapKit
import Kingfisher


class NewsTableViewCell: UITableViewCell {

    
	lazy var iconImageView: UIImageView = {
		
		let img = UIImageView()
		img.image = UIImage.init(named: "bbb")
		img.layer.cornerRadius = 5.0
		img.layer.masksToBounds = true
		return img
	}()
	
	lazy var titleLabel: UILabel = {
		let lab = UILabel()
		lab.font = .systemFont(ofSize: 16)
		lab.textColor = UIColor.hexColor(0x333333)
		lab.numberOfLines = 0
		
		return lab
	}()
	
	lazy var sourceLabel: UILabel = {
		let sourceLabel = UILabel()
		sourceLabel.textColor = UIColor.systemRed
		return sourceLabel
	}()
	
	//跟贴
	lazy var replyCountLabel: UILabel = {
		let replyCountLabel = UILabel()
		replyCountLabel.textColor = UIColor.systemPurple
		return replyCountLabel
	}()
	
	var newsModel : NewsModel? {
		
		didSet {
			titleLabel.text = newsModel?.title
			sourceLabel.text = newsModel?.source
			replyCountLabel.text = "\(newsModel?.replyCount ?? 0) 跟贴"
			
			//codeTest
//			titleLabel.backgroundColor = .systemRed
//			sourceLabel.backgroundColor = .systemGreen
//			replyCountLabel.backgroundColor = .systemOrange
			
			
			if sourceLabel.text == "网易新闻1" {
				iconImageView.image = UIImage(named: "111")
			} else {
				let iconURL = URL(string: newsModel?.imgsrc ?? "")
				iconImageView.kf.setImage(with: iconURL, placeholder: UIImage.init(named: "bbb"), options: nil, progressBlock: nil, completionHandler: nil)
			}
			
			
			iconImageView.contentMode = .scaleAspectFill
			
			
			
			
		}
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		initUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func initUI() {
		
		contentView.addSubview(iconImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(sourceLabel)
		contentView.addSubview(replyCountLabel)
		
		iconImageView.snp.makeConstraints { (make) in
			make.left.top.equalTo(10)
			make.size.equalTo(CGSize(width: 120, height: 100))
		}
		
		titleLabel.snp.makeConstraints { (make) in
			make.left.equalTo(iconImageView.snp_right).offset(10)
			make.right.equalTo(-10)
			make.top.equalTo(0)
			
		}
		
		sourceLabel.snp.makeConstraints { (make) in
			make.bottom.equalTo(-10)
			make.left.equalTo(iconImageView.snp_right).offset(10)
		}
		
		replyCountLabel.snp.makeConstraints { (make) in
			make.right.equalTo(-10)
			make.bottom.equalTo(-10)
			
		}
		
		
		
		
	}
	

}
