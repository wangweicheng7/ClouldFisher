//
//  ZLSwiftHeadView.swift
//  ZLSwiftRefresh
//
//  Created by 张磊 on 15-3-6.
//  Copyright (c) 2015年 com.zixue101.www. All rights reserved.
//

import UIKit

class ZLSwiftHeadView: UIView {
    
    var headLabel: UILabel = UILabel()
    var headImageView : UIImageView = UIImageView()
    
    var title:String {
        set {
            headLabel.text = newValue
        }
        
        get {
            return headLabel.text!
        }
    }
    
    var imgName:String {
        set {
            self.headImageView.image = UIImage(named: "dropdown_anim__000\(newValue)")
            self.headLabel.isHidden = true
        }
        
        get {
            return self.imgName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupUI(){
        let headImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        headImageView.center = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        headImageView.contentMode = .center
        headImageView.clipsToBounds = true;
        headImageView.image = UIImage(named: "dropdown_anim__0001.png")
        self.addSubview(headImageView)
        self.headImageView = headImageView
        
    }

    func startAnimation(){
//        let results:[AnyObject] = [
//            UIImage(named: "dropdown_loading_01.png")!,
//            UIImage(named: "dropdown_loading_02.png")!,
//            UIImage(named: "dropdown_loading_03.png")!
//        ]
        
//        self.headImageView.animationImages = results as [AnyObject]? as! [UIImage]?
//        self.headImageView.animationDuration = 0.6;
//        self.headImageView.animationRepeatCount = 0;
//        self.headImageView.startAnimating()
    }
    
    func stopAnimation(){
        self.headImageView.stopAnimating()
    }
}

