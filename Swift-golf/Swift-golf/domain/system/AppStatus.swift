//
//  AppStatus.swift
//  Swift-golf
//
//  Created by xubojoy on 15/8/24.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit

class AppStatus: NSObject,NSCoding{
//    private static var __once: () = {
//            var instance = AppStatus()
//        }()
    var user:User!
    var deviceToken:String?
//
//    class var sharedInstance : AppStatus {
//        struct Static {
//            static var onceToken : Int = 0
//            static var instance : AppStatus? = nil
//        }
//        _ = AppStatus.__once
//        return Static.instance!
//    }
    
    func logined() -> Bool{
    
        if self.user != nil && self.user.accessToken != nil{
            return true;
        }
        return false;
    }
    
    override init()
    {
        
    }
    
    required init?(coder aDecoder: NSCoder){
        
        super.init()
        self.user = aDecoder.decodeObject(forKey: "user") as? User
        self.deviceToken = aDecoder.decodeObject(forKey: "deviceToken") as? String
        
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.user, forKey: "user")
        aCoder.encode(self.deviceToken, forKey: "deviceToken")
    }
    
    func saveAppStatus(){
        NSLog("AppStatus to be saving:----\(self.description)");
        NSKeyedArchiver.archiveRootObject(self, toFile:AppStatus.savedPath(self)())
    }
    
    func savedPath() -> String{
        var documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentDirectory = documentDirectories[0]
        documentDirectory = (documentDirectory as NSString).appendingPathComponent("appStatus.archive")
        return documentDirectory
    }
    
    

}


// MARK:- 向外提供的方法
extension AppStatus {
    
    func ua() -> String{
        let ua = "golf_ios"
        let ua0 = ua.appendingFormat(",%@", UIDevice.current.systemVersion)
        
        let ua1 = ua0.appendingFormat(";%@,%.0f*%.0f", UIDevice.current.model,screen_width,screen_height)
        
        let dicInfo = Bundle.main.infoDictionary as NSDictionary!

//        let cFBundleName = dicInfo?.object(forKey: "CFBundleName")
        
        let cFBundleShortVersionString = dicInfo?.object(forKey: "CFBundleShortVersionString")
//        cFBundleName! as! CVarArg
        let ua2 = ua1.appendingFormat(";%@,%@", "golf",cFBundleShortVersionString! as! CVarArg)
        print(ua2)
        let ua3 = ua2.appendingFormat(";%@", UIDevice.current.identifierForVendor!.uuidString)
        print(ua3)
        self.deviceToken = (self.deviceToken == nil) ? "unknow" : self.deviceToken
        print(self.deviceToken ?? "")
        let ua4 = ua3.appendingFormat(";%@", self.deviceToken!)
        
        return ua4
    }

}
