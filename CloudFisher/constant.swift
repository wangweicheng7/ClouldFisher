//
//  constant.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/22.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

let api_token   = "45f983774e9e9f30daa1f2575953a04b"
let app_id      = "5837a004ca87a878ea0002cb"

let apps_list   = "http://api.fir.im/apps"  // 应用列表

let app_detail  = "http://api.fir.im/apps/" // 应用详情

func app_download_token(appid: String) -> String {
    return "http://api.fir.im/apps/\(appid)/download_token"
}
