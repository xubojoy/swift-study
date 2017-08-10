//
//  ViewController.swift
//  Swift-golf
//
//  Created by xubojoy on 15/6/29.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON
//import ObjectMapper

class MainViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tableView : UITableView!
    var dataArray = NSMutableArray()
    var slideArray = NSMutableArray()
    var slideImgArray = NSMutableArray()
    var slideTtlArray = NSMutableArray()
    var rightAddressBtn = UIButton()
//    var contentBlock: ContentBlock!
    var contentDict: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        loadHeaderView()
//        loadBlockData()
        userLogin()
//        self.initUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        comment()
    }
// MARK: - 数据加载
//  加载页面块数据
//    func loadBlockData(){
//        BlockStore.sharedInstance.getContentBlockByContentBlockId(1, completionBlock: { (contentBlock, err) -> Void in
//            if contentBlock != nil{
//                self.slideImgArray = NSMutableArray()
//                self.contentBlock = contentBlock
//                let _: ContentBlockItem?
//                for contentBlockItem in (self.contentBlock.contentBlockItems) {
//                    self.slideImgArray.add(contentBlockItem.contentElement.iconUrl!)
//                }
//                self.tableView.reloadData()
//            }
//            
//        })
//    }
//    
//    func comment(){
//        BlockStore.sharedInstance.commentArticle(40, userId: 42, content: "测试是否成功！") { (dict, err) -> Void in
//            self.contentDict = NSDictionary()
//            self.contentDict = dict
//            self.tableView.reloadData()
//        }
//    }
    
    func userLogin(){
//        UserStore.sharedInstance.userLogin("111111".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding), mobileNo: "18810734501".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)) { (user, err) -> Void in
//            print("----测试登陆信息-------\(user)")
//        }
        
//        UserStore.sharedInstance.createNewUserWithCompletion(0, name: "存在", mobileNo: "18810734605") { (user, err) -> Void in
//            println("----测试登陆信息-------\(user)")
//        }
        
    }
    
// MARK: - 初始化ui
    func initUI(){
        initTableView()
    }
    
    func loadHeaderView(){
//        self.headerView.renderHeaderViewTitle("每日高尔夫")
//        let indexUserImg: UIImage = UIImage(named: "index-left")!
//        self.headerView.backBtn.setImage(indexUserImg, for: UIControlState())
//        self.headerView.backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
//        self.headerView.backBtn.addTarget(self, action: #selector(MainViewController.showMenu), for: UIControlEvents.touchUpInside)
        initRightBtn()
    }
    
    func initRightBtn(){
        self.rightAddressBtn = UIButton(type: UIButtonType.custom)
        self.rightAddressBtn.frame = CGRect(x: screen_width-general_padding-60, y: 20, width: 60, height: 44)
        self.rightAddressBtn.setTitleColor(UIColor.black, for: UIControlState())
        let indexAddressImg: UIImage = UIImage(named: "index-right")!
        self.rightAddressBtn.setImage(indexAddressImg, for: UIControlState())
        self.rightAddressBtn.titleLabel?.font = UIFont.systemFont(ofSize: default_font_size)
        self.rightAddressBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -5)
        self.rightAddressBtn.setTitle("北京", for: UIControlState())
        self.rightAddressBtn.addTarget(self, action: #selector(MainViewController.rightBtnAddressClick), for: UIControlEvents.touchUpInside)
        self.headerView.addSubview(self.rightAddressBtn)
    }
    
    func initTableView(){
        self.tableView = UITableView(frame: CGRect(x: 0, y: self.headerView.frame.size.height, width: screen_width, height: screen_height-self.headerView.frame.size.height), style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    
    }
// MARK: - tableViewdelegate 及 datasource
    func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 1
        }
        else
        {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.section==0{
            return screen_width*1/2
        }
        else{
            return 106
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell
        if indexPath.section==0{
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            if self.slideImgArray.count > 0{
                let viewsArray = NSMutableArray()
                _ = [UIColor.cyan,UIColor.blue,UIColor.green]
                for  i in 0..<self.slideImgArray.count {
                    let tempImgaeView = UIImageView(frame:CGRect(x: 0, y: 0, width: screen_width, height: screen_width*1/2))
                    let imgString: AnyObject = self.slideImgArray[i] as AnyObject
//                    println(imgString)
                    _ = Foundation.URL(string:imgString as! String)!
//                    tempImgaeView.hnk_setImageFromURL(URL)
                    tempImgaeView.contentMode = UIViewContentMode.scaleAspectFill
                    tempImgaeView.clipsToBounds = true
                    viewsArray.add(tempImgaeView)
                }
//                let mainScorllView = YYCycleScrollView(frame:CGRect(x: 0, y: 0, width: screen_width, height: screen_width*1/2),animationDuration:2.0)
//                mainScorllView.backgroundColor = UIColor.purple
//                mainScorllView.fetchContentViewAtIndex = {(pageIndex:Int)->UIView in
//                    return viewsArray.object(at: pageIndex) as! UIView
//                }
//                
//                mainScorllView.totalPagesCount = {()->Int in
//                    return self.slideImgArray.count;
//                }
//                mainScorllView.TapActionBlock = {(pageIndex:Int)->() in
//                    print("点击了\(pageIndex)")
//                }
//                cell.contentView.addSubview(mainScorllView)
            }
            return cell
        }
        else{
            let cell = UITableViewCell(style:.default, reuseIdentifier:"myCell")
//            println("---是什么-------\(self.contentDict)")
            if self.contentDict != nil{
                let str = self.contentDict["content"] as? String
                cell.textLabel!.text = str
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view:UIView
        view = UIView(frame: CGRect(x: 0, y: 0, width: screen_width, height: 30))
        view.backgroundColor = UIColor.black
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       tableView.deselectRow(at: indexPath, animated: true)
//        let scvc = SecondViewController()
//        self.navigationController?.pushViewController(scvc, animated: true)
    }
// MARK: - UIButton 事件
//    func showMenu(){
//        self.sideMenuViewController.presentLeftViewController()
//    }
    
    func rightBtnAddressClick(){
//        let provinceVc = ProvinceListViewController()
//        self.navigationController?.pushViewController(provinceVc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

