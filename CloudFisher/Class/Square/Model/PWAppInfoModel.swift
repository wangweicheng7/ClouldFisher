//
//  PWAppInfoModel.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/29.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit
import ObjectMapper

class PWAppInfoModel: Mappable {
    
    required init?(map: Map) {
    }
    
    var id:     String?
    var type:	String?
    var name:	String?
    var desc:	String?
    var short:	String?
    var bundle_id:	String?
    var genre_id:	Int = 0
    var is_opened:	Bool = false
    var has_combo:	Bool = false
    var is_show_plaza:	Bool = false
    var created_at:	Int = 0
    var icon_url:	Int = 0
    var is_owner:	Bool = false
    var store_link_visible:	Bool = false
    var passwd: Bool = false
    
    func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        name <- map["name"]
        desc <- map["desc"]
        short <- map["short"]
        bundle_id <- map["bundle_id"]
        genre_id <- map["genre_id"]
        is_opened <- map["is_opened"]
        has_combo <- map["has_combo"]
        is_show_plaza <- map["is_show_plaza"]
        created_at <- map["created_at"]
        icon_url <- map["icon_url"]
        is_owner <- map["is_owner"]
        store_link_visible <- map["store_link_visible"]
        passwd <- map["passwd"]
    }
    
    
}
