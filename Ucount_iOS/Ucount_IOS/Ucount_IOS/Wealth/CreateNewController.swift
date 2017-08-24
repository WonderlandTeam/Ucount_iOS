//
//  CreateNewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/22.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit


protocol SendMessageDelegate {
    func sendWord (message : String)
}


class CreateNewController: UIViewController {
    
    @IBOutlet weak var typePicker: UIPickerView!  //账户类型
    
    @IBOutlet weak var money: UITextField! //账户余额
    @IBOutlet weak var name: UITextField!  //账户名称
    
    var countType : [String] = ["银行卡","信用卡","微信钱包"]
    
    var sendDelegate : SendMessageDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func  sendNameToWealth (sender : AnyObject) {
            print("点击两下")
        print(name.text!)
        let confirmAction = UIAlertAction(title: "确定",style : .default,handler: nil)
        if(name.text == "")
        {
            let alertName = UIAlertController(title : "系统提示",
                                                    message: "请输入账户名称",preferredStyle: .alert)
            
            
            

            
            
            alertName.addAction(confirmAction)
            
            
            self.present(alertName,animated: true,completion: nil)
        }
        
        else if(money.text == "")
        {
            let alertMoney = UIAlertController(title : "系统提示",
                                                    message: "请输入账户余额",preferredStyle: .alert)

            alertMoney.addAction(confirmAction)
            
            self.present(alertMoney,animated: true,completion: nil)
        }
        else
        {
            let alertSuccess = UIAlertController(title: "系统提示",message: "保存成功！",preferredStyle: .alert)
            
            alertSuccess.addAction(confirmAction)
            self.present(alertSuccess, animated: true, completion: nil)
        }
        
        
        
        print("点击一下")
        self.sendDelegate?.sendWord(message : name.text! )
        self.navigationController?.popViewController(animated: true)
            print("结束了")
        
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

