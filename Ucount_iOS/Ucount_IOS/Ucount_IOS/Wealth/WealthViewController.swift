//
//  WealthViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//


import UIKit

class WealthViewController : UIViewController,SendMessageDelegate{
    
    
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("进来了")
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "createNewSegue")
        {
            let Create = segue.destination as! CreateNewController
            Create.sendDelegate = self
            
        }
    }
    
    @IBAction func closeToWealth(segue : UIStoryboardSegue) {
        print("closess")
    }
    
    @IBAction func testbutton(){
        print("侧一下按钮")
        let view = CashViewController()
        
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func sendWord (message : String){
        print("这个方式执行了")
        print(message)
        
    }
}


