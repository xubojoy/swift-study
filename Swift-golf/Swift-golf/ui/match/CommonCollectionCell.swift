//
//  CommonCollectionCell.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/20.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class CommonCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var iconTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.iconImageView.backgroundColor = UIColor.white
    }
    
    
    func renderCommonCollectionCell(item:NSInteger){
        if item == 0 {
            self.iconImageView.image = #imageLiteral(resourceName: "holeinone_award_icon")
            self.iconTitleLabel.text = "奖品介绍"
        }else if  item == 1 {
            self.iconImageView.image = #imageLiteral(resourceName: "holeinone_my_point_icon")
            self.iconTitleLabel.text = "我的积分"
        }else{
            self.iconImageView.image = #imageLiteral(resourceName: "icon_rank")
            self.iconTitleLabel.text = "区域排名"
        }
    }
    
}
