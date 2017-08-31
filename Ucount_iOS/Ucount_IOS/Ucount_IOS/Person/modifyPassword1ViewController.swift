//
//  modifyPassword1ViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class modifyPassword1ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var againPassword: UITextField!
    
    
    override func viewDidLoad() {
        oldPassword.delegate = self
        newPassword.delegate = self
        againPassword.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        oldPassword.resignFirstResponder()
        newPassword.resignFirstResponder()
        againPassword.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        oldPassword.resignFirstResponder()
        newPassword.resignFirstResponder()
        againPassword.resignFirstResponder()
        return true
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        var alertController: UIAlertController
            
        if(newPassword.text == againPassword.text){
            alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
        }else{
            alertController = UIAlertController(title: "新密码不一致!",message: nil, preferredStyle: .alert)
        }
        
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
        
        if(newPassword.text == againPassword.text){
            self.navigationController?.popViewController(animated: true)
        }
        
    }

   
}



























