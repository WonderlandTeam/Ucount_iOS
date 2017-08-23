//
//  WealthViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//


import UIKit

class WealthViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("进来了")
    }
    
    @IBAction func closeToWealth(segue : UIStoryboardSegue) {
        print("closess")
    }
}

extension WealthViewController : SendMessageDelegate{
    func sendWord(message: String) {
        print(message)
    }
}

