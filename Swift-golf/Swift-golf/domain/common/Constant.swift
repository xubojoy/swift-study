//
//  Constant.swift
//  Swift-golf
//
//  Created by xubojoy on 15/7/3.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit
let IS_IOS6 = (UIDevice.current.systemVersion as NSString).doubleValue >= 6.0
let IS_IOS7 = (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0
let IS_IOS8 = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
let screen_width = UIScreen.main.bounds.size.width
let screen_height = UIScreen.main.bounds.size.height

let general_padding:CGFloat = 10
let general_cell_height:CGFloat = 44
let main_vc_right_space:CGFloat =  83
let general_space:CGFloat = 20
let general_margin:CGFloat = 15
let splite_line_height:CGFloat = 0.5



//字体大小
let smallest_font_size: CGFloat = 10
let smaller_font_size: CGFloat  =  11
let small_font_size: CGFloat    =  12
let default_2_font_size: CGFloat =  13
let  default_font_size: CGFloat  = 14
let default_1_font_size: CGFloat = 15
let big_font_size: CGFloat      = 16
let bigger_font_size: CGFloat   = 18
let  biggest_font_size: CGFloat =  24
let  default_txt_height: CGFloat =  16



//色值
let black_text_color      =    "#222222"
let unselect_title_color = "#818181"
let gray_text_color   =     "#666666"
let green_order_status_backgroud_color = "#7cc576"
let gray_order_status_backgroud_color = "#cccccc"
let blue_order_status_backgroud_color  = "#90c4f5"
let orange_order_status_backgroud_color = "#ff9933"
let splite_line_color       = "#cccccc"
let gray_line_color         =  "#434343"
let green_light_color       =  "#49c28d"
let common_bg_color         =  "#f4f4f4"



class Constant: NSObject {

}
// MARK:- 自定义打印方法
func LXFLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
        
    #endif
}
