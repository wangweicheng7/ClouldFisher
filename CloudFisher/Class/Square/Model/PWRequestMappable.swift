//
//  PTRequestModel.swift
//  CloudFisher
//
//  Created by 王炜程 on 2017/1/16.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import ObjectMapper


struct PWRequestMappable: Mappable {
    
    init?(map: Map) {
    }
    
    var code: Int = 200
    var data: Any?
    
    mutating func mapping(map: Map) {
        
    }
    
}
