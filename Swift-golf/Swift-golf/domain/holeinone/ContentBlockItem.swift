//
//  ContentBlockItem.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import HandyJSON
class ContentBlockItem: HandyJSON {

    var id: Int = 0
    var orderInx: Int = 0
    var iconUrl: String?

//    int id;//页面项id
//    int orderInx;//排序
//    BOOL showContent;//是否显示内容
//    ) int contentElementId;//页面项对应的页面元素id
//    int contentBlockId;//该页面项所属的页面块
//    NSString *name;//页面元素名称
//    NSString *iconUrl;//页面元素icon
//    NSString *content;//页面元素内容
//    NSString *contentMode;//内容类型（article:文章 ，video:视频 ,club:球场，golfRule:高球规则，
//    y:球具）
//    NSString *remark;// 备注
    
    required init() {
        
    }
}
