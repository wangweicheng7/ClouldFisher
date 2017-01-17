//
//  ZLSwiftFootView.swift
//  ZLSwiftRefresh
//
//  Created by 张磊 on 15-3-6.
//  Copyright (c) 2015年 com.zixue101.www. All rights reserved.
//

import UIKit

class ZLSwiftFootView: UIView {
    
    var gearRefreshView: GearRefreshView!
    
    override init(frame: CGRect) {
        gearRefreshView = GearRefreshView()
        super.init(frame: frame)
        gearRefreshView = GearRefreshView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ZLSwithRefreshFootViewHeight))
        gearRefreshView.backgroundColor = UIColor.red
        addSubview(gearRefreshView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
