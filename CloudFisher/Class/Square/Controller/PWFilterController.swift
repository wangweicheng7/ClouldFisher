//
//  PWFilterController.swift
//  CloudFisher
//
//  Created by 王炜程 on 2017/2/14.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import UIKit

class PWFilterController: UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var filterLeadingConstraint: NSLayoutConstraint!
    
    var dataSource = [(String, [String])]()
    var filterAction: ((_ appid: Int, _ version: String) -> Void)!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.filterLeadingConstraint.constant = 0
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
        
        for x in 0...10 {
            var ele: (String, [String])
            ele.0 = "名字\(x)"
            var tmp = [String]()
            for y in 0...20 {
                tmp.append("\(x).\(y)")
            }
            ele.1 = tmp
            dataSource.append(ele)
        }
        
        pickerView.reloadAllComponents()
    }
    
    @IBAction func filterAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: UIViewAnimationOptions.curveLinear, animations: {
            self.filterLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.15) {
            self.filterTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        let appid = pickerView.selectedRow(inComponent: 0)
        let version = pickerView.selectedRow(inComponent: 1)
        
        filterAction(1108, "1.3.9")
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: UIViewAnimationOptions.curveLinear, animations: {
            self.filterLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.15) {
            self.filterTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func reloadData() {
//        PWRequest.request(with: <#T##String#>, parameter: <#T##[String : Any]?#>, <#T##callback: PWServiceCallback##PWServiceCallback##(Any?, Bool, Int) -> ()#>)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: UIViewAnimationOptions.curveLinear, animations: {
            self.filterTopConstraint.constant = -180
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.15) {
            self.view.alpha = 1
            self.filterLeadingConstraint.constant = -(UIScreen.main.bounds.size.width - 16 - 44)
            self.view.layoutIfNeeded()
        }
    }
    
    init(_ filter: @escaping (_ appid: Int, _ version: String) -> Void) {
        super.init(nibName: "PWFilterController", bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .custom
        filterAction = filter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PWFilterController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dataSource.count
        }else{
            let com = pickerView.selectedRow(inComponent: 0)
            return dataSource[com].1.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if component == 0 {
            return NSAttributedString(string: dataSource[row].0)
        }
        let com = pickerView.selectedRow(inComponent: 0)
        let titles = dataSource[com].1
        return NSAttributedString(string: titles[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
        }
    }
}
