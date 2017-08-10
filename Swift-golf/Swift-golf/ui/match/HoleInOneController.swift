//
//  HoleInOneController.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/1/9.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
import SDCycleScrollView
import DynamicColor
import FNMatchPull
import MJRefresh

class HoleInOneController: BaseViewController {
    var bannerImgArray: [String] = [String]()
    var cycleScrollView = SDCycleScrollView()
    var holeInOneUserPoint = HoleInOneUserPoint()
    var holeInOneCategoryView = HoleInOneCategoryView()
    var holeInOneUserPointArray: [HoleInOneUserPoint] = [HoleInOneUserPoint]()
    // 底部加载
//   let footer = MJRefreshAutoNormalFooter()
    
    lazy var tableView: UITableView = { [unowned self] in
       let table = UITableView(frame: CGRect(x:0,y:(20),width:screen_width,height:(screen_height-49-20)), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = DynamicColor(hexString: common_bg_color)
        table.separatorStyle = .none
        let nib = UINib.init(nibName: "CommonHoleRankCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "commonHoleRankCell")
        self.view.addSubview(table)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
//        self.headerView.initHeader("挑战赛", navigationController: self.navigationController!)
//        self.headerView.backBtn.isHidden = true
        
        requestBannerData()
        requestRankDetails()
        
        let matchAnimator = FNMatchPullAnimator(frame: CGRect(x: 0, y: 0, width: screen_width, height: 80))
        matchAnimator.text = "FNOZ"
        matchAnimator.lineWidth = 4.0
        matchAnimator.style = .text
//        self.tableView.addPullToRefreshWithAction({
//            //refresh action
//            OperationQueue().addOperation {
//                sleep(4)
//                OperationQueue.main.addOperation {
//                    self.tableView.stopPullToRefresh()
//                }
//            }
//        }, withAnimator: matchAnimator)
        
        
//        //上刷新相关设置
//        footer.setRefreshingTarget(self, refreshingAction: #selector(HoleInOneController.footerLoad))
//        self.tableView.mj_footer = footer
        
        
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(HoleInOneController.headerRereshing))
        
        self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(HoleInOneController.footerRereshing))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func headerRereshing() {
        
    }
    
    func footerRereshing() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- 请求Rank排行榜数据
extension HoleInOneController {
    func requestRankDetails() {
        HoleInOneStore.requestRank(year: 2017, count: 100, pageNo: 1, pageSize: 20) { (result, error) in
            if error != nil {
                LXFLog(error)
                NSLog("-----------\(error)")
            } else {
                let json = JSON(result as Any)
                NSLog("-----积分榜------\(json)")
                if let liveArray = JSONDeserializer<HoleInOneUserPoint>.deserializeModelArrayFrom(json: json["items"].description) {
                    self.holeInOneUserPointArray = liveArray as! [HoleInOneUserPoint]
                }
            }
            self.tableView.reloadData()
        }
        
    }
    
    
    func requestBannerData() {
        HoleInOneStore.requestBannerData(contentBlockId: 17) { (result, error) in
            if error != nil {
                LXFLog(error)
//                NSLog("-----------\(error)")
            } else {
                let json = JSON(result as Any)
                //                NSLog("------轮播图信息-----\(json)")
                let discoveryColumns = JSONDeserializer<ContentBlock>.deserializeFrom(json: json.description)
                //                NSLog("------轮播打印-----\(discoveryColumns?.contentBlockItems)")
                for contentBlockItem in (discoveryColumns?.contentBlockItems)! {
//                    NSLog("------图片地址-----\(contentBlockItem?.iconUrl)")
                    self.bannerImgArray.append(contentBlockItem?.iconUrl ?? "")
                }
            }
            self.tableView.reloadData()
        }
    }
    
    func requestPointRankData() {
        
    }

}

extension HoleInOneController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.holeInOneUserPointArray.count+3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.cyan
            if self.bannerImgArray.count > 0 {
                self.cycleScrollView = SDCycleScrollView(frame: CGRect(x:0, y:0, width:screen_width,height: (screen_width/2)), delegate: self, placeholderImage: #imageLiteral(resourceName: "golf_default_place_holder.jpg"))
                self.cycleScrollView.imageURLStringsGroup = self.bannerImgArray
                self.cycleScrollView.delegate = self;
                self.cycleScrollView.autoScrollTimeInterval = 6.0;
                cell.contentView.addSubview(self.cycleScrollView)
            }
            return cell
        }else if indexPath.row == 1 {
            let cell = UITableViewCell()
            self.holeInOneCategoryView = HoleInOneCategoryView(frame: CGRect(x: 0, y: 10, width: screen_width, height: 70))
                
            self.holeInOneCategoryView.backgroundColor = UIColor.white
            cell.contentView.addSubview(self.holeInOneCategoryView)
            return cell
        }else if indexPath.row == 2 {
            let cell = UITableViewCell()
            cell.backgroundColor = DynamicColor(hexString: common_bg_color)
            cell.selectionStyle = .none
            let rankMarkView = RankMarkView(frame: CGRect(x: 0, y: general_padding, width: screen_width, height: 40))
//            rankMarkView.backgroundColor = DynamicColor(hexString: green_light_color)
            cell.contentView.addSubview(rankMarkView)
            return cell
            
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "commonHoleRankCell", for: indexPath) as? CommonHoleRankCell
            cell?.selectionStyle = .none
            cell?.backgroundColor = DynamicColor(hexString: common_bg_color)
            self.holeInOneUserPoint = self.holeInOneUserPointArray[indexPath.row-3]
            cell?.renderCommonHoleRankCell(holeInOneUserPoint: self.holeInOneUserPoint, row: indexPath.row)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if self.bannerImgArray.count > 0 {
                return screen_width/2
            }else{
                return 0
            }
        }else if indexPath.row == 1 {
            return 90
        }else if indexPath.row == 2 {
            return 50
        }
        else{
            return 60
        }
    }
}

extension HoleInOneController: SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
}

