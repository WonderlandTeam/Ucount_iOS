//
//  bankCardViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class bankCardViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.placeholder = "请输入银行卡号"
        passWord.placeholder = "请输入密码"
        
        passWord.isSecureTextEntry = true

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
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
