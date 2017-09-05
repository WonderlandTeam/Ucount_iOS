//
//  addBudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class addBudgetViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var typePicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var money: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var types = ["总预算","彩妆","护肤品","交通","恋爱","社交","通讯和网费","文具","兴趣"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.typePicker.delegate = self
        self.typePicker.dataSource = self        // Do any additional setup after loading the view.
        self.money.delegate = self
        self.view.bringSubview(toFront: self.saveButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        if(pickerView == self.typePicker){
            return 1
        }else{
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (pickerView == self.typePicker){
            return types.count
        }else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //let row1 = pickerView.selectedRow(inComponent: 0)
        if (pickerView == self.typePicker){
            return types[row]
        }else{
            return nil
        }
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        let date = datePicker.date
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dformatter.string(from: date)
        let type = types[Int(self.typePicker.selectedRow(inComponent: 0).description)!]
        
        let budgetAdded = Budget(type: type, money: Float(self.money.text!)!, date: dateStr)
        budgets.append(budgetAdded)
        
    }
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        money.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        money.resignFirstResponder()
        return true
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true) { 
    
        }
    }

}
