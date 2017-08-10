//
//  CommonNavigationController.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/15.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class CommonNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appearance = UIBarButtonItem.appearance()
//        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: -60), for: .default)
//        self.navigationBar.isTranslucent = true
//        self.navigationBar.barTintColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 0.8)
//        self.navigationBar.barTintColor = UIColor.white
//        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0), NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)]
//        self.navigationBar.tintColor = UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
//        self.navigationItem.title = "Example"
        
        self.navigationBar.isHidden = true
        
        self.navigationController?.isNavigationBarHidden = true
        
        
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
