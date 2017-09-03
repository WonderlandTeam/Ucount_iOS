//
//  BudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var picker: UIPickerView!
   
    var currentYear:String!
    var currentMonth:String!
    
    var years = [String]()
    var months = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dateFormatter:DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var dateString:String = dateFormatter.string(from: NSDate() as Date);
        var dates = dateString.components(separatedBy: "/")
        currentYear  = (dates[0])
        currentMonth = (dates[1])
    
        for i in 0 ... 10{
            years.append(String(Int(currentYear)!+i))
        }
        
        for i in 1...12{
            months.append(String( i))
        }
        
        
        picker.delegate = self
        picker.dataSource = self

    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 0)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return  2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (component == 0){
            return years.count
        }else{
            return months.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //let row1 = pickerView.selectedRow(inComponent: 0)
        if (component == 0){
            return String(years[row])
        }else{
            return String(months[row])
        }
    }


}




































