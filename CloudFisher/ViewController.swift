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
        automaticallyAdjustsScrollViewInsets = false
        
        
        
        tableView.toLoadMoreAction { [weak self] in
            let lastInfo = self?.dataSource.last
            self?.requestData(with: lastInfo?.id)
        }
        
        requestData(with: nil)
        
//        localNotification.fireDate = Date(timeIntervalSinceNow: 5)
        self.localNotification.alertBody = "\("葡萄维度") 发布新版本了，快来看看吧~"
        
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 5) {
                UIApplication.shared.scheduleLocalNotification(self.localNotification)
            
        }
    }
    
    var localNotification: UILocalNotification = {
        let localNotification = UILocalNotification()
        localNotification.alertAction = ""
        localNotification.hasAction = true
        localNotification.alertLaunchImage = ""
        localNotification.alertTitle = "新消息"
        localNotification.applicationIconBadgeNumber = 1
        return localNotification
    }()
    
    func requestData(with id: Int?) {
        
        var parameter = [String: Any]()
        if let id = id {
            parameter["id"] = id
        }
        
        PWRequest.request(with: Api.app_list, parameter: parameter, to: "") { (result, success, code) in
            
            self.tableView.stopAnimation()
            guard let list = result as? [[String:Any]] else {
                return
            }
            for a in list {
                if let model = PWAppInfoModel(JSON: a) {
                    self.dataSource.append(model)
                }
                if let id = id {
                    
                }
            }
            self.tableView.reloadData()
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell(), for: indexPath) as! PWSquareTableViewCell
//        cell.model = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}

