//
//  planDetailViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class planDetailViewController: UIViewController ,UITextFieldDelegate{
    
    typealias PlanCallBack = (_ modify: Plan)->Void
    var callback:PlanCallBack!

    var plan: Plan!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var haveLabel: UILabel!
    @IBOutlet weak var everydayNeed: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var modifyMoney: UIButton!
    
    @IBOutlet weak var modifyDate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    
    override func viewWillAppear(_ animated: Bool){
        self.nameLabel.text = plan.name
        self.moneyField.text = String(plan.money)
        self.dateLabel.text = plan.date
        self.haveLabel.text = String(plan.hasMoney)
        self.everydayNeed.text = String(plan.moneyEveryday)
        
        self.saveButton.isHidden = true
        self.moneyField.isEnabled = false
        self.datePicker.isHidden = true
        
        self.moneyField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.callback(self.plan)
        self.dismiss(animated: true) { 
            
        }
    }

    @IBAction func modifyMoneyTapped(_ sender: UIButton) {
        self.saveButton.isHidden = false
        self.moneyField.isEnabled = true
    }
    
    @IBAction func modifyDateTapped(_ sender: UIButton) {
        self.saveButton.isHidden = false
        self.datePicker.isHidden = false
        self.dateLabel.isHidden = true
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        self.plan.money = Float(self.moneyField.text!)!
        var dateFormatter:DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd";
        var dateString:String = dateFormatter.string(from: NSDate() as Date)
        self.plan.date = dateString
        self.callback(self.plan)
        self.dismiss(animated: true) { 
            
        }
    }
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        self.moneyField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        self.moneyField.resignFirstResponder()
        return true
    }

}
