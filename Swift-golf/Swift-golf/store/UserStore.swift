//
//  UserStore.swift
//  Swift-golf
//
//  Created by xubojoy on 15/8/24.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit

class UserStore: NSObject {
    private static var __once: () = {
            var instance = UserStore()
        }()
    class var sharedInstance : UserStore {
        struct Static {
            static var onceToken : Int = 0
            static var instance : UserStore? = nil
        }
        _ = UserStore.__once
        return Static.instance!
    }
    
    func userLogin(pwd: String,mobileNo:String,_ finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) {
        let parameters:Dictionary? = ["pwd":pwd,"name":mobileNo]
        let url:String = "http://test.golfd.cn/api/userSessions"
        HttpRequestFacade.sharedInstance.requestData(methodType: .POST, urlString: url, parameters: parameters as [String : AnyObject]?) { (result, error) in
            LXFLog(result)
            finished(result, error)
        }
    }
}
