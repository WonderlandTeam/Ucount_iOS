//
//  RegisterViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telephone.delegate = self
        username.delegate = self
        password.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //点到view的别的地方，焦点从textfield转移,反焦点
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        telephone.resignFirstResponder()
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    //点击return，键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
}

