//
//  HoleInOneUserPoint.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/27.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import HandyJSON
class HoleInOneUserPoint: HandyJSON {

    var id: Int = 0
    var userId: Int = 0
    var pointCount: Int = 0 // 用户总积分，用作排名
    var pointExchangeGift: Int = 0 //用户可兑换礼品积分，用于兑换礼品
    var year: Int = 0
    var user = PointUser?() // 用户对象
    var orderInx: Int = 0 // 用户积分排行，如果是0则 显示“无排名”，只有查询用户一杆进洞积分接口中才显示此属性
    var areaOrderInx: Int = 0 //用户区域排名
    var areaNo: Int = 0 // 用户所属区域
    required init() {
        
    }
}
