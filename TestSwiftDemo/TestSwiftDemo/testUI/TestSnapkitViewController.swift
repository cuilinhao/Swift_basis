//
//  TestSnapkitViewController.swift
//  TestSwift_layout
//
//  Created by 崔林豪 imac on 2021/10/26.
//

import UIKit

import CoreGraphics.CGImage
import AVFoundation


class TestSnapkitViewController: UIViewController {
    
    
    lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var yellowView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    lazy var blueView : UIView = {
       
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemGray
        
        //testUI()
        
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        
        view.setNeedsUpdateConstraints()
        
//        let vv = UIView()
//        view.addSubview(vv)
//        vv.snp.makeConstraints { make in
//            make.edges.equalTo(UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 30))
//        }
//        vv.backgroundColor = .systemBlue
        
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
        
        blackView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        redView.snp.makeConstraints { make in
//            make.top.equalTo(blackView.snp.bottom).offset(20.0)
            make.top.equalTo(blackView.snp_bottomMargin)
            make.right.equalTo(blackView.snp.left).offset(-20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
       
        
        
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.left.equalTo(blackView.snp.right).offset(20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        blueView.snp.makeConstraints { make in
            make.bottom.equalTo(blackView.snp.top).offset(-20)
            make.left.equalTo(blackView.snp.right).offset(20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        greenView.snp.makeConstraints { make in
            make.bottom.equalTo(blackView.snp.top).offset(-20)
            make.right.equalTo(blackView.snp.left).offset(-20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        redView.snp.updateConstraints { make in
            make.right.equalTo(blackView.snp.left).offset(-120)
        }
        
        
    }
    
    func testUI() {
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        
        view.addSubview(blackView)
        
        blackView.snp.makeConstraints { make in
            
            //make.left.top.equalTo(10)
            make.left.equalTo(30)
            make.top.equalTo(90)
            
            //make.right.equalTo(-100)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
        
        let redView = UIView()
        redView.backgroundColor = .systemRed
        
        //view.addSubview(redView)
        blackView.addSubview(redView)
        redView.snp.makeConstraints { make in
            //make.right.edges.equalTo(.uie)
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 10, bottom: 10, right: 0))
        }
    }

    func testUI2() {
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        view.addSubview(blackView)
        blackView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    
    func testDevice() {
        //1 视频的输入
        
        let devices = AVCaptureDevice.devices()
        
        guard let device = devices.filter({
            $0.position == .front
        }).first else {
            
            print("get front video AVCaptureDevice")
            
            return
        }
    }
    
    

}
