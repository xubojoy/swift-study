//
//  CommonHoleRankCell.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/27.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import DynamicColor
import SDWebImage
class CommonHoleRankCell: UITableViewCell {

    
    
    @IBOutlet weak var rankNumLabel: UILabel!
    
    @IBOutlet weak var userAvatarIMageView: UIImageView!
    
    @IBOutlet weak var userPhoneLabel: UILabel!
    
    
    @IBOutlet weak var pointLabel: UILabel!
    
    
    
    @IBOutlet weak var dowmLine: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.dowmLine.backgroundColor = DynamicColor(hexString: splite_line_color)
        self.pointLabel.textColor = DynamicColor(hexString: orange_order_status_backgroud_color)
        self.rankNumLabel.textColor = DynamicColor(hexString: gray_text_color)
        self.userAvatarIMageView.layer.cornerRadius = self.userAvatarIMageView.frame.size.width/2
        self.userAvatarIMageView.layer.masksToBounds = true
    }
    
    func renderCommonHoleRankCell(holeInOneUserPoint: HoleInOneUserPoint,row:NSInteger) {
        
        self.rankNumLabel.text = String.init(format: "%d", holeInOneUserPoint.orderInx)
        
        self.userAvatarIMageView.sd_setImage(with: URL(string:(holeInOneUserPoint.user?.avatarUrl)!), placeholderImage: #imageLiteral(resourceName: "user_icon"))
        
        let telNo = holeInOneUserPoint.user?.loginMobileNo
        
        let leftStr = telNo?.substring(to: (telNo?.index((telNo?.startIndex)!, offsetBy: 3))!)
        let rightStr = telNo?.substring(from: (telNo?.index((telNo?.endIndex)!, offsetBy: -4))!)
        
        let leftTmpStr = leftStr?.appending("****")
        let rightTmpStr = leftTmpStr?.appending(rightStr!)
    
        self.userPhoneLabel.text = rightTmpStr
        
        self.pointLabel.text = String.init(format: "%d 分", holeInOneUserPoint.pointCount)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
