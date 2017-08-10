//
//  User.swift
//  Swift-golf
//
//  Created by xubojoy on 15/8/24.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit

class User: NSObject,NSCoding,NSCopying {
    var id:Int!
    var name:String?
    var userCode:String?
    var userGender:Int!
    var avatarUrl:String?
    var accessToken:String?
    var loginMobileNo:String?
    
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init()
        self.id=aDecoder.decodeInteger(forKey: "age")
        self.name=aDecoder.decodeObject(forKey: "name") as? String
        self.userCode = aDecoder.decodeObject(forKey: "userCode") as? String
        self.userGender = aDecoder.decodeInteger(forKey: "userGender")
        self.avatarUrl = aDecoder.decodeObject(forKey: "avatarUrl") as? String
        self.accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String
        self.loginMobileNo = aDecoder.decodeObject(forKey: "loginMobileNo") as? String

    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.userGender, forKey: "userGender")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.userCode, forKey: "userCode")
        aCoder.encode(self.avatarUrl, forKey: "avatarUrl")
        aCoder.encode(self.accessToken, forKey: "accessToken")
        aCoder.encode(self.loginMobileNo, forKey: "loginMobileNo")
    }
    
    func copy(with zone: NSZone?) -> Any{
        let user = User.init()
        user.id = self.id
        user.name = self.name
        user.userCode = self.userCode
        user.userGender = self.userGender
        user.avatarUrl = self.avatarUrl
        user.accessToken = self.accessToken
        user.loginMobileNo = self.loginMobileNo
        return user
    }
    
}
