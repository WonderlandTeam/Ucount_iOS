//
//  CreateNewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/22.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit


protocol SendMessageDelegate :class {
    func sendWord (message : [String])
}


class CreateNewController: UIViewController {
    
    @IBOutlet weak var typePicker: UIPickerView!  //账户类型
    
    @IBOutlet weak var money: UITextField! //账户余额
    @IBOutlet weak var name: UITextField!  //账户名称
    
    var countType : [String] = ["银行卡","信用卡","微信钱包"]
    
    var newInfo : [String] = [] //封装新建账户类型
    
    weak var sendDelegate : SendMessageDelegate?

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
            
            
            self.present(alertSuccess, animated: true, completion: nil)
            print("选择类型"+"\(typePicker.selectedRow(inComponent: 0))")
            if sendDelegate != nil{
                 newInfo.append(name.text!)
                 newInfo.append(money.text!)
                 newInfo.append(countType[typePicker.selectedRow(inComponent: 0)])
                 self.sendDelegate?.sendWord( message: newInfo )
            }
            
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            

        }
        
        
        
        
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

