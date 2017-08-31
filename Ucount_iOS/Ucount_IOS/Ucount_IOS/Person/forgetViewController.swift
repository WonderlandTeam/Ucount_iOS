//
//  forgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class forgetViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var phoneOrEmail: UITextField!
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var sendMessage: UILabel!
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        phoneOrEmail.resignFirstResponder()
        code.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        phoneOrEmail.resignFirstResponder()
        code.resignFirstResponder()
        return true
    }
    
    @IBAction func sendTapped(_ sender: UIButton) {
        if(phoneOrEmail.text?.characters.count == 11 ){//输入的手机格式正确
            self.sendMessage.isHidden = false
            self.codeLabel.isHidden = false
            self.code.isHidden = false
            self.okButton.isHidden = false
        }else{
            let alertController = UIAlertController(title: "手机格式有误",message: nil,preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func isPurnInt(string: String) -> Bool {
        let scan: Scanner = Scanner(string: string)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendMessage.isHidden = true
        self.codeLabel.isHidden = true
        self.code.isHidden = true
        self.okButton.isHidden = true
        
        self.code.delegate = self
        self.phoneOrEmail.delegate = self
        
        self.phoneOrEmail.text=""
        self.code.text=""

    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        if(identifier == "forgetToPassword2"){
            if(code.text == "1234"){
                return true
            }else{
                let alertController = UIAlertController(title: "验证码错误",message: nil,preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
                return false
            }
        }
        return false
    }



}





