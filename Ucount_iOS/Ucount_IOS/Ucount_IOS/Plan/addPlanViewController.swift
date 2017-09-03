//
//  addPlanViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/4.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

typealias addPlanCallBack = (_ add: Plan)->Void
class addPlanViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var planName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var money: UITextField!
    
    var callBack: addPlanCallBack!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.planName.delegate = self
        self.money.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        self.planName.resignFirstResponder()
        self.money.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        self.planName.resignFirstResponder()
        self.money.resignFirstResponder()
        return true
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.callBack(Plan(name: "", date: "", money: 0, hasMoney: 0, completeDate: "", moneyEveryday: 0))
        
        self.dismiss(animated: true) {
            
        }
    }

    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        var name = self.planName.text
        var dateFormatter:DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd";
        var dateString:String = dateFormatter.string(from: self.datePicker.date as Date)
        var money = Float(self.money.text!)
        self.callBack(Plan(name: name!, date: dateString, money: money!, hasMoney: 0, completeDate: "", moneyEveryday: 0))
        self.dismiss(animated: true) {
            
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
