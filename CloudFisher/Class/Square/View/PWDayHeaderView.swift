//
//  PWDayHeaderView.swift
//  CloudFisher
//
//  Created by weicheng wang on 2017/1/14.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import UIKit


class PWDayHeaderView: UITableViewHeaderFooterView {

    
    
    class var identifier: String {
        return "PWDayHeaderViewIdentifier"
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
