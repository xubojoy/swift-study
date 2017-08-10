//
//  ViewControllerExt.swift
//  Swift-golf
//
//  Created by xubojoy on 15/7/6.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit
import Foundation
extension UIViewController {

    func setRightSwipeGestureAndAdaptive(){
        setRightSwipeGesture()
        adaptive()
    }
    
    func setRightSwipeGesture(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(UIViewController.goback(_:)))
        swipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipe)
    }
    
    func adaptive(){
        if IS_IOS7
        {
            self.edgesForExtendedLayout = UIRectEdge();
            self.view.frame = UIScreen.main.bounds;
            self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        }
        else if IS_IOS6
        {
            self.view.frame = UIScreen.main.applicationFrame;
        }
    }
    
    func goback(_ sender: AnyObject){
//        self.navigationController?.popToRootViewController(animated: true)
    }

}
