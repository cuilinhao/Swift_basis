//
//  ViewController.swift
//  TestSwiftDemo
//
//  Created by 崔林豪 imac on 2021/10/26.
//

import UIKit
import Alamofire
//import 


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "cellID"
    let demos = ["testDemo", "2","3"]
    
    //debugPrint(<#T##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
    lazy var tableView: UITableView = {
       
        let tt = UITableView(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        tt.delegate = self
        tt.dataSource = self
        tt.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        //tt.separatorStyle = .SeparatorStyle
        
        tt.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        return tt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title  = " testDemo"
        view.backgroundColor = .lightGray
        
        view.addSubview(tableView)
        
        //AF.requ
        
    }
    
    func test() {
        
    }
    
    
    //MARK: - Deleagte
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellID)! as UITableViewCell
        
        cell.textLabel?.text = demos[indexPath.row]
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let vc = TestSnapkitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 1  {
            
            //self.navigationController?.pushViewController(TestUIViewController(), animated: true)
            
            let vc = TestUIViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            print("+++++++=")
        }
    }

}

