//
//  PWSquareInfoView.swift
//  CloudFisher
//
//  Created by 王炜程 on 2017/2/14.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import UIKit

class PWSquareInfoView: UIView {

    private let bgView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 15, y: 0, width: 60, height: 60))
        iv.image = UIImage(named: "icon")
        return iv
    }()
    let nameLabel: UILabel = {
        let l = UILabel(frame: CGRect(x: 85, y: 15, width: 200, height: 35))
        l.text = "测试标题"
        return l
    }()
    
    let noticSwitch: UISwitch = {
        let s = UISwitch(frame: CGRect(x: 105, y: 15, width: 100, height: 35))
        s.isOn = true
        s.addTarget(self, action: #selector(noticeSwitchAction(_:)), for: .valueChanged)
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgView.frame = frame
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(noticSwitch)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        bgView.frame = bounds
        imageView.center = CGPoint(x: 45, y: bounds.height/2)
    }
    
    func show() {
        UIView.animate(withDuration: 0.25) { 
            self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.bounds.size.width, height: 100)
        }
        
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.25) {
            self.frame = CGRect(x: 0, y: self.frame.origin.y, width: UIScreen.main.bounds.size.width, height: 0)
        }
    }
    
    func noticeSwitchAction(_ sender: UISwitch) {
        
        PWRequest.request(with: Api.notice, parameter: ["appid": 1108, "on": sender.isOn]) { (result, success, code) in
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
