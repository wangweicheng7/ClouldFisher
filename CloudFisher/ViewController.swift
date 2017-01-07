//
//  ViewController.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/15.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PWSquareTableViewCell", bundle:nil), forCellReuseIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell())
        
        PWServiceManager.appList { (result, success, code) in
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PWSquareTableViewCell.IdeSquareTableViewCell(), for: indexPath) as! PWSquareTableViewCell
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

