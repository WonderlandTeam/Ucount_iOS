//
//  addBudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class addBudgetViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    var years = [String]()
    var months = [String]()
    @IBOutlet weak var typePicker: UIPickerView!
    
    @IBOutlet weak var monthPicker: UIPickerView!
    
    @IBOutlet weak var money: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
   // @IBOutlet weak var backButton: UIButton!
    
    var types = ["总预算","彩妆","护肤品","交通","恋爱","社交","通讯和网费","文具","兴趣"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.typePicker.delegate = self
        self.typePicker.dataSource = self// Do any additional setup after loading the view.
        
        self.monthPicker.delegate = self
        self.monthPicker.delegate = self
        self.money.delegate = self
        self.view.bringSubview(toFront: self.saveButton)
        
        for i in 0 ... 10{
            years.append(String(Int(2017)+i))
        }
        
        for i in 1...12{
            months.append(String( i))
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        if(pickerView == self.typePicker){
            return 1
        }else{
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (pickerView == self.typePicker){
            return types.count
        }else{
            if(component == 0){
                return years.count
            }else{
                return months.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //let row1 = pickerView.selectedRow(inComponent: 0)
        if (pickerView == self.typePicker){
            return types[row]
        }else{
            if(component == 0){
                return String(years[row])
            }else{
                return String(months[row])
            }
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    

    @IBAction func saveTapped(_ sender: UIButton) {
    
      //  let dateStr = String(years[self.monthPicker.selectedRow(inComponent: 0)])+"-"+String(months[self.monthPicker.selectedRow(inComponent: 1)])
        
        let type = types[Int(self.typePicker.selectedRow(inComponent: 0).description)!]
        
        let budgetAdded = Budget(type: type, money: Float(self.money.text!)!, month: Int(months[self.monthPicker.selectedRow(inComponent: 1)])!, year: Int(years[self.monthPicker.selectedRow(inComponent: 0)])!, left: Float(self.money.text!)!)
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
    
}
