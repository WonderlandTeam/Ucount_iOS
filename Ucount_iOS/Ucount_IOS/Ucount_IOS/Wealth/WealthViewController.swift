//
//  WealthViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//


import UIKit

class WealthViewController : UIViewController,SendMessageDelegate{
    
    
    typealias sendInfoBlock = (_ info: [String]) -> Void //传递新创建的账户信息
    
    var sendToCreate : sendInfoBlock?
    var allAcountVC : allAcountableViewController?
    
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
        else if(segue.identifier == "allAcountInfo")
        {
            allAcountVC = segue.destination as! allAcountableViewController
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
    
    func sendWord (message : [String]){
        
        print(message[0])
        print(message[1])
        print(message[2])
        
        allAcountVC!.typeName.append(message[0])
        allAcountVC!.typeMoney.append(message[1])
        print("已发送")
        
    }
}


