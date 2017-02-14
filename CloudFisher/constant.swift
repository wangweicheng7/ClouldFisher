//
//  constant.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/22.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit

extension UIColor {
    class var theme: UIColor {
        return UIColor(red:0.36, green:0.52, blue:0.92, alpha:1)
    }
}

extension Data {
    var hexString: String {
        return withUnsafeBytes {(bytes: UnsafePointer<UInt8>) -> String in
            let buffer = UnsafeBufferPointer(start: bytes, count: count)
            return buffer.map {String(format: "%02hhx", $0)}.reduce("", { $0 + $1 })
        }
    }
}

struct Api {
    
    static let baseUrl      = "https://putao.wangweicheng.com"
    
    static let app_list     = "/app_list"
    
    static let update       = "/update"
    
    static let device_token = "/upload_token"
    
    static let notice       = "/notice_switch"
    
    static let file         = "/file/"
    
    static let image        = "/image/"
    
}
