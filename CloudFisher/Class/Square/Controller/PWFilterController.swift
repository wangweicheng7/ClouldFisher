//
//  PWFilterController.swift
//  CloudFisher
//
//  Created by 王炜程 on 2017/2/14.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import UIKit

class PWFilterController: UIViewController {

    @IBOutlet weak var pickerBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
//    @IBOutlet var tapAction: UITapGestureRecognizer!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.25) {
            self.pickerBottomConstraint.constant = 216
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        pickerBottomConstraint.constant = -300
        
    }
    
    init() {
        super.init(nibName: "PWFilterController", bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
