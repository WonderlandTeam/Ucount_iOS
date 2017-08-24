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
    
    @IBOutlet weak var typePicker: UIPickerView!
    
    @IBOutlet weak var name: UITextField!
    
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
    
    @IBAction func  sendNameToWealth (sender : AnyObject) {
            print("点击两下")
        
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

