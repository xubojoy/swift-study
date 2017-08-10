//
//  ColorUtils.swift
//  Swift-golf
//
//  Created by xubojoy on 15/7/3.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit

class ColorUtils: NSObject {
    
    func colorWithHexString(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )  
    }
    
}
