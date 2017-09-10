//
//  modifyBudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/10.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

typealias budgetCallBack = (_ bud: Budget)->Void
class modifyBudgetViewController: UIViewController,UITextFieldDelegate {
    
    var callBack: budgetCallBack!
    var budget: Budget!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var moneyField: UITextField!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var comfirmButton: UIButton!
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        moneyField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        moneyField.resignFirstResponder()
        return true
    }

    
    
    @IBAction func modifyButton(_ sender: UIButton) {
        self.moneyField.isEnabled = true
        self.comfirmButton.isHidden = false
    }
    
    @IBAction func comfirmTapped(_ sender: UIButton) {
        self.budget.money = Float(self.moneyField.text!)!
        self.callBack(self.budget)
        self.dismiss(animated: true) { 
            
        }
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        self.budget.type = ""
        self.callBack(self.budget)
        self.dismiss(animated: true) { 
            
        }
    }

    @IBAction func backTapped(_ sender: UIButton) {
        self.callBack(self.budget)
        self.dismiss(animated: true) { 
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.typeLabel.text = budget.type
        self.monthLabel.text = String(budget.year)+"年"+String(budget.month)+"月"
        self.moneyField.text = String(budget.money)
        self.leftLabel.text = String(budget.left)
        
        self.moneyField.isEnabled = false
        self.comfirmButton.isHidden = true
        
        moneyField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
