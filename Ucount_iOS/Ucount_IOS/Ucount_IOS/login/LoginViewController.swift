//
//  ViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/18.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var idText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idText.delegate = self
        passwordText.delegate = self
        self.loginButton.backgroundColor = UIColor(red: 123/255, green: 237/255, blue: 67/255, alpha: 0.6)
        self.loginButton.layer.cornerRadius = 20
        self.navigationController?.isNavigationBarHidden = true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //点到view的别的地方，焦点从textfield转移,反焦点
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        idText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    //点击return，键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true
    }

}

