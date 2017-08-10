//
//  TabbarViewController.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController,TabBarDelegate {

    weak var customTabBar = TabBar()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        
        setupTabbar()

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for child in self.tabBar.subviews {
            if child.isKind(of: UIControl.self) {
                child.removeFromSuperview()
            }
        }
    }
    
    func setupTabbar() -> Void {
        let customTabBar = TabBar.init(frame: self.tabBar.bounds)
        customTabBar.tabbarDelegate = self
        self.tabBar.addSubview(customTabBar)
        self.customTabBar = customTabBar
    }
    
    //    MARK:FZHTabBarDelegate
    func tabbar(_ tabbar: TabBar, formWhichItem: Int, toWhichItem: Int) {
        self.selectedIndex = toWhichItem
    }
    
    func setupChildVC(_ childVC: UIViewController,title: String,imageName: String,selectImageName: String, isAnimation: TabbarHideStyle){
        
        childVC.view.backgroundColor = UIColor.white
        childVC.title = title
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        //        不在渲染图片
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectImageName)?.withRenderingMode(.alwaysOriginal)
        
        let navigationCtrl = navigationControllerWith(childVC)
        navigationCtrl.navigationBar.barTintColor = UIColor.white
        navigationCtrl.tabbarHideStyle = isAnimation
//        navigationCtrl.delegate = self
        self.addChildViewController(navigationCtrl)
        //        添加tabbar内部按钮
        self.customTabBar!.addTabbarButtonWith(childVC.tabBarItem)
    }
    
    func navigationControllerWith(_ vc: UIViewController) -> NavigationController {
        let nav = NavigationController(rootViewController: vc)
        nav.delegate = self
        return nav
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



// MARK:- NavigationController代理
extension TabbarViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        if viewController.hidesBottomBarWhenPushed {
////            bgImageView.isHidden = true
//        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        tabBar.isHidden = true
        NSLog(">>>>>>>>>>>>>>>>>>%@",viewController)
//        if !viewController.hidesBottomBarWhenPushed {
////            bgImageView.isHidden = falses
//        }
        
        
        
    }
}

