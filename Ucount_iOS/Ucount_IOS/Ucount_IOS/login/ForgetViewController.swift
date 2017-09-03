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
    
    @IBOutlet weak var codeNodification: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBAction func sendTapped(_ sender: UIButton) {
        self.codeNodification.isHidden = false
        self.codeLabel.isHidden = false
        self.codeField.isHidden = false
        self.confirmButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneOrMail.delegate = self
        
        self.confirmButton.backgroundColor = UIColor(red: 123/255, green: 237/255, blue: 67/255, alpha: 0.6)
        self.confirmButton.layer.cornerRadius = 20
        self.codeNodification.isHidden = true
        self.codeLabel.isHidden = true
        self.codeField.isHidden = true
        self.confirmButton.isHidden = true
        //self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //点到view的别的地方，焦点从textfield转移,反焦点
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneOrMail.resignFirstResponder()
        codeField.resignFirstResponder()
    }
    
    //点击return，键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        phoneOrMail.resignFirstResponder()
        codeField.resignFirstResponder()
        return true
    }
    
    
    
    
}
