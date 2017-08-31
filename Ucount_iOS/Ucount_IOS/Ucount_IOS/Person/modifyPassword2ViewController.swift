//
//  modifyPassword2ViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class modifyPassword2ViewController: UIViewController {

    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var againPassword: UITextField!
    
    override func viewDidLoad() {
        self.newPassword.text=""
        self.againPassword.text = ""
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okTapped(_ sender: UIButton) {
        if(newPassword.text == againPassword.text){
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
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
