//
//  HoleInOneStore.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/15.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class HoleInOneStore: NSObject {
    class func requestRank(year:Int,count:Int,pageNo:Int,pageSize:Int,_ finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) {
        let url:String = String(format:"https://api.golfd.cn/holeInOneUserPoints/year,%d/sort?count=%d&pageNo=%d&pageSize=%d",year,count,pageNo,pageSize)
        NSLog(">>>>>>>\(url)")
        HttpRequestFacade.sharedInstance.requestData(methodType: .GET, urlString: url, parameters: nil) { (result, error) in
//            LXFLog(result)
            finished(result, error)
        }
    }
    
    
    class func requestBannerData(contentBlockId:Int,_ finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) {
        let url:String = String(format:"https://cms.golfd.cn/contentBlocks/%d",contentBlockId)
        NSLog(">>>轮播图>>>>\(url)")
        HttpRequestFacade.sharedInstance.requestData(methodType: .GET, urlString: url, parameters: nil) { (result, error) in
            //            LXFLog(result)
            finished(result, error)
        }
    }
    
}
