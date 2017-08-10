//
//  NSStringExtension.swift
//  JokeClient-Swift
//
//  Created by YANGReal on 14-6-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//
import UIKit
import Foundation

extension String {
   
    func stringHeightWith(_ fontSize:Float,width:Float)->Float
    {
        let font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        let size = CGSize(width: CGFloat(width),height: CGFloat.greatestFiniteMagnitude)
       // var attr = [font:NSFontAttributeName]
      

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping;
        let  attributes = [NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
      
        return Float(rect.size.height)
        
    }
    
    func dateStringFromTimestamp(_ timeStamp:NSString)->String
    {
        let ts = timeStamp.doubleValue
        
        //var date = NSDate.timeIntervalSince1970: NSTimeInterval { get }
        let  formatter = DateFormatter ()
        formatter.dateFormat = "yyyy年MM月dd日 HH:MM:ss"
//        var date = formatter.dateFromString(timeStamp)
//        println(date)
//        return "2014-01-01"
//       // return formatter.stringFromDate(date)
//        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1296035591];
//        NSLog(@"1296035591  = %@",confromTimesp);
//        NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
//        NSLog(@"confromTimespStr =  %@",confromTimespStr);
        
        let date = Date(timeIntervalSince1970 : ts)
         return  formatter.string(from: date)
        
    }
    
}
