//
//  WealthViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//


import UIKit

class WealthViewController : UIViewController,SendMessageDelegate{
    
     let Create = CreateNewController() //设置代理
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("进来了")
       
        Create.sendDelegate = self
    }
    
    @IBAction func closeToWealth(segue : UIStoryboardSegue) {
        print("closess")
    }
    
    func sendWord (message : String){
        print("这个方式执行了")
        print(message)
        
    }
}


