//
//  HeaderView.swift
//  Swift-golf
//
//  Created by xubojoy on 15/6/29.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit
import DynamicColor
class HeaderView: UIView {
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var downLine: UIView!
    var nc:UINavigationController!
    override func awakeFromNib() {
        self.downLine.backgroundColor = DynamicColor(hexString: splite_line_color)
        
    }
    
    func initHeader(_ titleStr:NSString, navigationController:UINavigationController){
        self.nc = navigationController
        let btnImage: UIImage = UIImage(named: "left_arrow")!
        self.backBtn.setImage(btnImage, for: UIControlState())
        self.backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        self.backBtn.addTarget(self, action: #selector(HeaderView.popToFrontViewController(_:)), for: UIControlEvents.touchUpInside)
        
        self.titleLab.font = UIFont.boldSystemFont(ofSize: 16)
        self.titleLab.textColor = DynamicColor(hexString: green_light_color)
        self.titleLab.text = titleStr.replacingPercentEscapes(using: String.Encoding.utf8.rawValue)
    }
    
//    func renderHeaderViewTitle(){
//        self.titleLab.font = UIFont.boldSystemFont(ofSize: 16)
////        self.titleLab.textColor = SWColor(hexString: black_text_color)
//        self.titleLab.text = titleStr.replacingPercentEscapes(using: String.Encoding.utf8.rawValue)
//    }
    
    func popToFrontViewController(_ sender: AnyObject){
        self.nc!.popViewController(animated: true)
    }
    
}
