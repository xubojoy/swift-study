//
//  RankMarkView.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/22.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import SnapKit
import DynamicColor
class RankMarkView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    func setupSubviews() {
        let remarkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screen_width, height: 20))
        
//        remarkLabel.snp.makeConstraints { (make) in
//            make.left.right.equalTo(self.snp.left).offset(0)
//            make.top.equalTo(self.snp.top)
//            make.height.equalTo(20)
//        }
        remarkLabel.backgroundColor = .cyan
        remarkLabel.text = "年度排行榜"
        remarkLabel.textAlignment = .center
        remarkLabel.font = .boldSystemFont(ofSize: 16)
        remarkLabel.backgroundColor = DynamicColor(hexString: common_bg_color)
        self.addSubview(remarkLabel)
        
        
        let leftLine = UIView(frame: CGRect(x: general_padding, y: remarkLabel.frame.size.height+(19/2), width: (screen_width-100-20)/2, height: 1))
        leftLine.backgroundColor = DynamicColor(hexString: splite_line_color)
        self.addSubview(leftLine)
        
        let topYearLabel = UILabel(frame: CGRect(x: (screen_width-100)/2, y: 20, width: 100, height: 20))
        topYearLabel.text = "TOP OF YEAR"
        topYearLabel.backgroundColor = UIColor.blue
        topYearLabel.textAlignment = .center
        topYearLabel.font = .systemFont(ofSize: 10)
        topYearLabel.textColor = DynamicColor(hexString: gray_line_color)
        topYearLabel.backgroundColor = DynamicColor(hexString: common_bg_color)
        self.addSubview(topYearLabel)
        
        let rightLine = UIView(frame: CGRect(x: (screen_width-100)/2+100, y: remarkLabel.frame.size.height+(19/2), width: (screen_width-100-20)/2, height: 1))
        rightLine.backgroundColor = DynamicColor(hexString: splite_line_color)
        self.addSubview(rightLine)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
