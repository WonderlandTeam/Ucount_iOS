//
//  ForgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var phoneOrMail: UITextField!
  
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirm: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneOrMail.delegate = self
        password.delegate = self
        confirm.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //点到view的别的地方，焦点从textfield转移,反焦点
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneOrMail.resignFirstResponder()
        password.resignFirstResponder()
        confirm.resignFirstResponder()
    }
    
    //点击return，键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
}