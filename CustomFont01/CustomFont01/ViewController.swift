//
//  ViewController.swift
//  CustomFont01
//
//  Created by xubojoy on 2017/8/10.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.text = "Whatever happens tomorrow, we had today."
        self.label.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("Change Font Family", for: .normal)
        changeBtn.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        changeBtn.setTitleColor(.purple, for: .normal)
        self.view.addSubview(changeBtn)
        
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
        }
        printAllSupportedFontNames()
    }
    
    func changeFontFamily() {
        self.label.font = UIFont(name: "Copperplate-Light", size: 20)
    }
    
    func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("+++++++++++\(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            
            for fontName in fontNames {
                print("_____________\(fontName)")
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

