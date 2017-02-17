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

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var appid: Int?
    var version: String?
    
    let infoView = PWSquareInfoView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 0))
    
    private var dataSource = [PWAppInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "广场"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PWSquareTableViewCell", bundle:nil), forCellReuseIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell())
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.toLoadMoreAction { [weak self] in
            let lastInfo = self?.dataSource.last
            self?.requestData(with: lastInfo?.id, desc: true)
        }
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            infoLabel.text = "putao.wangweicheng.com v \(version)"
        }
        
        view.addSubview(infoView)
        
        requestData(with: nil, desc: true)
        checkUpdate()
    }
    
    var localNotification: UILocalNotification = {
        let localNotification = UILocalNotification()
        localNotification.hasAction = true
        localNotification.applicationIconBadgeNumber = 1
        return localNotification
    }()
    /// id 起始id，desc，是否上拉
    func requestData(with id: Int?, desc: Bool) {
        
        var parameter = [String: Any]()
        if let id = id {
            parameter["id"] = id
        }
        parameter["pull"] = desc
        if let appid = appid {
            parameter["appid"] = appid
        }
        if let version = version {
            parameter["version"] = version
        }
        
        PWRequest.request(with: Api.app_list, parameter: parameter) { (result, success, code) in
            
            self.tableView.stopAnimation()
            guard let list = result as? [[String:Any]] else {
                return
            }
            for a in list {
                if let model = PWAppInfoModel(JSON: a) {
                    self.dataSource.append(model)
                }
            }
            
            if self.dataSource.count == 0{
                return
            }
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: self.dataSource.count - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
        }
    }
    
    @IBAction func filterAction(_ sender: UIButton) {
        let filter = PWFilterController { [weak self] (appid, version) in
            self?.appid = appid
            self?.version = version
            self?.requestData(with: nil, desc: true)
        }
        self.present(filter, animated: false, completion: nil)
    }
    
    func checkUpdate() {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] else {
            return
        }
        
        PWRequest.request(with: Api.update, parameter: ["version": version]) { (result, success, code) in
            guard let info = result as? [String:Any] else {
                return
            }
            if let update = info["update"] as? Bool, update {
                
                let alert = UIAlertController(title: "CloudFisher 有新版本可供使用，请及时更新", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "1小时后", style: UIAlertActionStyle.destructive, handler: { (action) in
                    let date = Date(timeIntervalSinceNow: 3600)
                    self.localNotification.fireDate = date
                    self.localNotification.alertBody = "CloudFisher 有新版本可供使用，请及时更新"
                    UIApplication.shared.scheduleLocalNotification(self.localNotification)
                }))
                
                alert.addAction(UIAlertAction(title: "马上更新", style: UIAlertActionStyle.default, handler: { (action) in
                    let urlString = "itms-services://?action=download-manifest&url=\(Api.baseUrl)/file/update.plist"
                    if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.openURL(url)
                    }
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
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
        return 180
    }

}

