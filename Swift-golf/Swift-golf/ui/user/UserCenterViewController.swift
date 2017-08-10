//
//  UserCenterViewController.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/1/9.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class UserCenterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        self.headerView.initHeader("我", navigationController: self.navigationController!)
        self.headerView.backBtn.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
