//
//  ExampleProvider.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit
import Foundation
import ESTabBarController_swift
enum ExampleProvider {
    static func tabbarWithNavigationStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
//        let contentView = ESTabBarItemContentView()
//        contentView.textColor = UIColor.white
        
        tabBarController.tabBar.backgroundColor = UIColor.white
        tabBarController.tabBar.backgroundImage = UIImage.init(named: "under_bar")
        tabBarController.tabBar.barTintColor = UIColor.white

        let nrewsvc = NewsViewController()
        let privatevc = PrivateViewController()
        let holevc = HoleInOneController()
        let uservc = UserCenterViewController()
        
        nrewsvc.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "新闻", image: UIImage(named: "tabbar_news_icon_default"), selectedImage: UIImage(named: "tabbar_news_icon_select"))
        privatevc.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(),title: "订场服务", image: UIImage(named: "tabbar_ private_icon_default"), selectedImage: UIImage(named: "tabbar_ private_icon_select"))
        holevc.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(),title: "挑战赛", image: UIImage(named: "hole_in_one_default_icon"), selectedImage: UIImage(named: "hole_in_one_select_icon"))
        uservc.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(),title: "我", image: UIImage(named: "tabbar_user_icon_default"), selectedImage: UIImage(named: "tabbar_user_icon_select"))
        
        let n1 = CommonNavigationController.init(rootViewController: nrewsvc)
        let n2 = CommonNavigationController.init(rootViewController: privatevc)
        let n3 = CommonNavigationController.init(rootViewController: holevc)
        let n4 = CommonNavigationController.init(rootViewController: uservc)
                
        tabBarController.viewControllers = [n1, n2, n3, n4]
        
        return tabBarController
    }
}
