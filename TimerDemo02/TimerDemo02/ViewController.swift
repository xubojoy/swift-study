//
//  ViewController.swift
//  TimerDemo02
//
//  Created by xubojoy on 2017/8/10.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    var resultLabel: UILabel!
    var timer: Timer!
    var labelNum: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel = UILabel()
        self.view.addSubview(resultLabel)
        resultLabel.textColor = UIColor.black
        resultLabel.backgroundColor = UIColor.purple
        resultLabel.textAlignment = .center
        resultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }
        resultLabel.font = UIFont.systemFont(ofSize: 30)
        resultLabel.text = "0"
        
        
        let startBtn = UIButton(type: .custom)
        startBtn.setTitle("start", for: .normal)
        startBtn.backgroundColor = UIColor.cyan
        startBtn.addTarget(self, action: #selector(startBtnClick), for: .touchUpInside)
        view.addSubview(startBtn)
        startBtn.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.size.width/2)
            make.left.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.top.equalTo(view).offset(200)
        }
        
        
        let endBtn = UIButton(type: .custom)
        endBtn.setTitle("start", for: .normal)
        endBtn.backgroundColor = UIColor.orange
        endBtn.addTarget(self, action: #selector(endBtnClick), for: .touchUpInside)
        view.addSubview(endBtn)
        endBtn.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.size.width/2)
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.top.equalTo(view).offset(200)
        }
    }

    func startBtnClick() {
        print("++++++++++++开始")
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            self.labelNum = self.labelNum + 0.1
            self.resultLabel.text = String(format: "%.1f", self.labelNum)
        })
        self.timer.fire()
    }
    
    func endBtnClick() {
        print("-----------结束")
        guard let timerForDistory = self.timer
            else {return}
        
        timerForDistory.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

