//
//  HttpRequestFacade.swift
//  Swift-golf
//
//  Created by xubojoy on 15/7/6.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
/// 定义枚举类型
enum RequestType: Int {
    case GET
    case POST
}
class HttpRequestFacade: NSObject {

//    class var sharedInstance : HttpRequestFacade {
//        struct Static {
//            static var onceToken : dispatch_once_t = 0
//            static var instance : HttpRequestFacade? = nil
//        }
//        dispatch_once(&Static.onceToken) {
//            Static.instance = HttpRequestFacade()
//        }
//        return Static.instance!
//    }
    
    class var sharedInstance : HttpRequestFacade {
        struct Static {
        static let sharedInstance : HttpRequestFacade = HttpRequestFacade()
        }
        return Static.sharedInstance
    }
}

// MARK:- 封装请求方法
extension HttpRequestFacade {
    // MARK: 请求JSON数据
    func requestData(methodType: RequestType, urlString: String, parameters: [String : AnyObject]?, finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        
        // 1.定义请求结果回调闭包
        let resultCallBack = { (response: DataResponse<Any>) in
            if response.result.isSuccess {
                finished(response.result.value as AnyObject?, nil)
            } else {
                finished(nil, response.result.error as NSError?)
            }
        }
        // 2.请求数据
        let httpMethod: HTTPMethod = methodType == .GET ? .get : .post
        let httpHeader: HTTPHeaders = ["User-Agent" : AppStatus().ua()]
        
        request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: httpHeader).responseJSON(completionHandler: resultCallBack)
    }
}

