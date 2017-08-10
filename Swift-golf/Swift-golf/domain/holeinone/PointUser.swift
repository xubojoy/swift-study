//
//  PointUser.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/27.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import HandyJSON
class PointUser: HandyJSON {
    
    var accessToken: String?
    var avatarUrl: String?
    var id: Int = 0
    var loginMobileNo: String?
    var name: String?
    var pointScore = 0
    var userGender = 0
    required init() {
        
    }
}
