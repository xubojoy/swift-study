//
//  DailyGolfTabbar.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/1/10.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class DailyGolfTabbar: NSObject ,UINavigationControllerDelegate {
    
//    var tabBarController = RAMAnimatedTabBarController()
    
    
    override init() {
        super.init()
        let firstViewController = NewsViewController()
        let firstNavigationController = UINavigationController.init(rootViewController: firstViewController)
        firstNavigationController.delegate = self;
        firstNavigationController.title = "新闻";
        firstNavigationController.navigationBar.isHidden = true
        
        let secondViewController = PrivateViewController()
        let secondNavigationController = UINavigationController.init(rootViewController: secondViewController)
        secondNavigationController.delegate = self;
        secondNavigationController.title = "订场服务";
        secondNavigationController.navigationBar.isHidden = true
        
        let thirdViewController = HoleInOneController()
        let thirdNavigationController = UINavigationController.init(rootViewController: thirdViewController)
        thirdNavigationController.delegate = self;
        thirdNavigationController.title = "挑战赛";
        thirdNavigationController.navigationBar.isHidden = true
        
        let userViewController = UserCenterViewController()
        let userNavigationController = UINavigationController.init(rootViewController: userViewController)
        userNavigationController.delegate = self;
        userNavigationController.title = "我";
        userNavigationController.navigationBar.isHidden = true
//        
//        self.tabBarController = [[RDVTabBarController alloc] init];
//        [self.tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
//        thirdNavigationController,userNavigationController]];
//        self.tabBarController.delegate = self;
//        //设置各个item的图像
//        [self customizeTabBarForController:self.tabBarController];
//        let ram = RAMAnimatedTabBarController()
        

    }

}
