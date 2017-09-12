//
//  messageDetailViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class messageDetailViewController: UIViewController {
    
    var message: Message!
    @IBOutlet weak var content: UITextView!

    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.content.text = message.content
        self.content.layer.borderWidth = 0
        self.content.layer.borderColor = UIColor.gray.cgColor
        self.content.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func modifyTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "modifyBudgetView") as! modifyBudgetViewController
        var bud = Budget(type: "食堂", money: 800, month: 9, year: 2017, left: 20)
        vc.budget = bud
        
       vc.callBack = ({(bud: Budget)->Void  in
        
        })
        
        self.present(vc,animated: true)
        
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
