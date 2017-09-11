//
//  bankCardViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class bankCardViewController: UIViewController {
    
    @IBOutlet weak var userName: SkyFloatingLabelTextFieldWithIcon!

    
    @IBOutlet weak var passWord: SkyFloatingLabelTextFieldWithIcon!
    

    
    let overcastGreen = UIColor.init(red: 0x5E/255, green: 0xC9/255, blue: 0xAF/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
        userName.placeholder = "请输入银行卡号"
        userName.title = "银行卡号"
        userName.iconFont = UIFont.init(name: "FontAwesome", size: 13)
        userName.iconText = "\u{f007}"
        userName.iconMarginBottom = -3
        userName.tintColor = overcastGreen
        userName.selectedTitleColor = overcastGreen
        userName.selectedLineColor = overcastGreen
        
        
        
        passWord.placeholder = "请输入密码"
        passWord.title = "密码"
        passWord.iconFont = UIFont.init(name: "FontAwesome", size: 13)
        passWord.iconText = "\u{f084}"
        passWord.iconMarginBottom = -3
        passWord.tintColor = overcastGreen
        passWord.selectedTitleColor = overcastGreen
        passWord.selectedLineColor = overcastGreen
        
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
    
    @IBAction func login(_ sender: Any)
    {
        if(userName.text == "")
        {
            SweetAlert().showAlert("登录失败", subTitle: "请填写正确的银行卡号", style: AlertStyle.error)
        }
        else if(passWord.text == "")
        {
            SweetAlert().showAlert("登录失败", subTitle: "请填写正确的密码", style: AlertStyle.error)
        }
        else
        {
            SweetAlert().showAlert("登录成功", subTitle: "恭喜您登录成功", style: AlertStyle.success)
            
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
