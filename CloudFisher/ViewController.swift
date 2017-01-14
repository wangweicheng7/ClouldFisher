//
//  ViewController.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/15.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = [PWAppInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "广场"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PWSquareTableViewCell", bundle:nil), forCellReuseIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell())
        
        PWRequest.request(with: Api.app_list, parameter: nil, to: "") { (result, success, code) in
            guard let list = result as? [[String:Any]] else {
                return
            }
            for a in list {
                let model = PWAppInfoModel(JSON: a)
                self.dataSource.append(model!)
            }
            self.tableView.reloadData()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell(), for: indexPath) as! PWSquareTableViewCell
        cell.model = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

