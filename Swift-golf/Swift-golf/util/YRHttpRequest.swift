//
//  YRHttpRequest.swift
//  JokeClient-Swift
//
//  Created by YANGReal on 14-6-5.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit
import Foundation

//class func connectionWithRequest(request: NSURLRequest!, delegate: AnyObject!) -> NSURLConnection!


class YRHttpRequest: NSObject {

    override init()
    {
        super.init();
    }
    
    class func requestWithURL(_ urlString:String,completionHandler:@escaping (_ data:AnyObject)->Void)
    {
        let URL = Foundation.URL(string:urlString)
        let req = NSMutableURLRequest(url:URL!)
        req.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:29.0) Gecko/20100101 Firefox/29.0",forHTTPHeaderField:"User-Agent")
        let queue = OperationQueue();
        NSURLConnection.sendAsynchronousRequest(req as URLRequest, queue: queue, completionHandler: { response, data, error in
            if (error != nil)
            {
                DispatchQueue.main.async(execute: {
                    print(error)
                    completionHandler(NSNull())
                })
            }
            else
            {
                let _:NSError?
                let jsonData = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary

                DispatchQueue.main.async(execute: {
                    completionHandler(jsonData)
                })
            }
        })
    }
    
    
    
}
