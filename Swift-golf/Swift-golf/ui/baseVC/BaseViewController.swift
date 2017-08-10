//
//  BaseViewController.swift
//  Swift-golf
//
//  Created by xubojoy on 15/6/29.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var headerView: HeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initHeaderView()
        // Do any additional setup after loading the view.
    }
    
    func IS_IOS7() ->Bool {
        return (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0
    }
    func IS_IOS8() -> Bool {
        return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
    }
    
    func initHeaderView(){
        var xibViews = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.headerView = xibViews?[0] as? HeaderView
        self.headerView.frame = CGRect(x: 0, y: 0, width: screen_width,height: (IS_IOS7() ?64:44))
        self.view.addSubview(self.headerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
