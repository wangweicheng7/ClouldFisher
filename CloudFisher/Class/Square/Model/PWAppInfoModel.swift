//
//  PWAppInfoModel.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/29.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit
import ObjectMapper

struct PWAppInfoModel: Mappable {
    
    init?(map: Map) {
        
    }
    
    var id:     Int = 0
    var build:  Int?
    var appid:  Int?
    var icon:   String?
    var note:    String?
    var version: String?
    var name:	String?
    var type:   Int = 0
    var create_time: Double = 0
    
    
    
    mutating func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
        note    <- map["note"]
        icon    <- map["icon"]
        appid   <- map["appid"]
        build   <- map["build"]
        version <- map["version"]
        type    <- map["type"]
        create_time <- map["create_time"]
    }
}

