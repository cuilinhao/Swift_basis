//
//  TestUIViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 imac on 2021/10/28.
//

import UIKit
import SnapKit


class TestUIViewController: UIViewController {
    
    
    
     let scrollView = UIScrollView()
    
     let contentView = UIView()
    
    let label: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = .blue
        label.numberOfLines = 0
        
        label.lineBreakMode = .byClipping
        
        label.textColor = .white
       
        label.text = NSLocalizedString("test fdhjfd test fdhjfdtest fdhjfdtest fdhjfdtest fdhjfdtest fdhjfdtest fdhjfd", comment: "")
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
        
        initUI()
        
    }
    

    override func updateViewConstraints() {
        
        //print("---updateViewConstraints---")
        print("++123")
        
        label.snp.updateConstraints { make in
            make.top.equalTo(120)
        }
        
        super.updateViewConstraints()
        
    }
    
    
    func initUI() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets.zero)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        label.snp.makeConstraints { make in
            
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
        
    }

}
