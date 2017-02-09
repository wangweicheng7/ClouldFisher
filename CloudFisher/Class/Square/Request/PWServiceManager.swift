//
//  PWServiceManager.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/29.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit
import Alamofire

typealias PWServiceCallback = (_ result: Any?, _ success: Bool, _ responseCode: Int) -> ()


class PWRequest {
    
    class func request(with path: String, parameter: [String: Any]?, _ callback: @escaping PWServiceCallback) {
        PWRequest.request(with: path, parameter: parameter, to: "", callback)
    }
    
    class func request<T>(with path: String, parameter: [String: Any]?,to model: T, _ callback: @escaping PWServiceCallback) {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        manager.session.configuration.timeoutIntervalForResource = 10
        
        
        Alamofire.request(Api.baseUrl + path, method: .get, parameters:parameter).responseJSON { (response) in
            guard let res = response.result.value as? [String: Any] else {
                callback([], false, 703)
                return
            }
            callback(res["data"], true, 200)
        }
    }
    
    class func heartBeats(_ callback: @escaping PWServiceCallback) {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        manager.session.configuration.timeoutIntervalForResource = 10
        
        Alamofire.request(Api.baseUrl + "", method: .get, parameters:nil).responseJSON { (response) in
            guard let res = response.result.value else {
                return
            }
            callback(res, true, 200)
        }
    }
}
        
//        PWServiceManager.baseRequest(.get, URLString: "\(apps_list)/\(app_id)", parameters: nil, completionHandler: {(request, response, data, error) in
//            
//            
//        })
        

        
//    class func baseRequest(_ method: HTTPMethod, URLString: String, parameters: [String: Any]? = nil, completionHandler: @escaping (URLRequest?, DefaultDataResponse?, Data?, Error?) -> Void) {
        /*
        var getPath = "?"
        
        var param = [String: Any]()
        param["api_token"] = api_token
        
        
        if let parameters = parameters {
            for (key, value) in parameters {
                param[key] = value
                let str = key + "=" + (value as! String) + "&"
                getPath = getPath + str
            }
            print("========================================================================")
            print("\(URLString)\(getPath)")
            print("========================================================================")
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        manager.session.configuration.timeoutIntervalForResource = 10
        Alamofire.request(URLString, method: method, parameters:parameters).response { response in
            
            completionHandler(response.request, response, response.data, response.error)
        }*/
//    }
