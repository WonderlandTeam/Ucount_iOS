//
//  WealthViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//


import UIKit

class WealthViewController : UIViewController,SendMessageDelegate{
    
    @IBOutlet weak var test2: UIView!
    
    @IBOutlet weak var test3: UIImageView!
    
    var test :[[Int:String]] = [[Int:String]]()
    
    
    var allAcountVC : allAcountableViewController? //账户类型界面
    var itemizeVC : itemizeViewController? //账户交易详情界面
    
    var cashView : CashViewController!
    var bankView : bankCardViewController!
    var schoolView : schoolCardViewController!
    var alipayView : aliPayViewController!
    
    var jumpTo : String?
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test2 = self.view.viewWithTag(1)!
        
        test3 = self.view.viewWithTag(2) as! UIImageView
        
        test2.backgroundColor = UIColor.clear
        
        self.view.sendSubview(toBack: test3)
        
        cashView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "cash") as! CashViewController
        
        bankView = UIStoryboard(name:"Wealth", bundle:nil).instantiateViewController(withIdentifier: "bankCard") as!
            bankCardViewController
        
        schoolView = UIStoryboard(name:"Wealth", bundle:nil).instantiateViewController(withIdentifier: "schoolCard") as!
            schoolCardViewController
        
        alipayView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "aliPay") as!
            aliPayViewController
        
        cashView.sendToWealth = {( backStr:[Int:String]) -> Void in
            //print(self.itemizeVC)
            self.test.append(backStr)
            
        }

        
        
        NotificationCenter.default.addObserver(self, selector: #selector(WealthViewController.selectedTypeFunc(notification:)), name: NSNotification.Name( "selectedType"), object: nil)
        print("进来了")
       
    }
    


    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "createNewSegue")
        {
            print("瞥一瞥")
            let Create = segue.destination as! CreateNewController
            Create.sendDelegate = self
            
        }
        else if(segue.identifier == "allAcountInfo")
        {
            allAcountVC = segue.destination as! allAcountableViewController
            print("瞅一瞅"+"\(allAcountVC)")
        }
        else if(segue.identifier == "countRecord")
        {
            itemizeVC = segue.destination as! itemizeViewController
            itemizeVC?.countRecord = test
            print("瞧一瞧"+"\(itemizeVC)")
        }
        
        
    }
    
    @IBAction func closeToWealth(segue : UIStoryboardSegue) {
        print("closess")
    }
    

    
    func sendWord (message : [String]){
        
        print(message[0])
        print(message[1])
        print(message[2])
        
        allAcountVC!.typeName.append(message[0])
        allAcountVC!.typeMoney.append(message[1])
        allAcountVC!.countType.append(message[2])
        print("已发送")
        
    }
    
    
    //通知响应方法
    func selectedTypeFunc(notification: NSNotification) {
        jumpTo = notification.object as! String
        switch jumpTo {
        case "银行卡"?:
            
            self.present(bankView, animated: true, completion: nil)
            break
        case "现金"?:
            
            self.present(cashView, animated: true, completion: nil)
            break
        case "支付宝"?:
            
            self.present(alipayView, animated: true, completion: nil)
            break
        case "校园卡"?:
            
            self.present(schoolView, animated: true, completion: nil)
            break
        default:
            break
        }
        
    }
}


