//
//  ContentBlock.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import HandyJSON
class ContentBlock: HandyJSON {

    var id: Int = 0
    
    var name: String?
    
    var remark: String?
    var contentPageId: Int = 0
    var orderInx: Int = 0
    var blockType: Int = 0
    
    var contentBlockItems: Array<ContentBlockItem?> = []
    
    required init() {}
}
