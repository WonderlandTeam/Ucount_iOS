//
//  ViewControllerExtension.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

extension BudgetViewController: UIPickerViewDataSource{
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
}


extension  BudgetViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //let row1 = pickerView.selectedRow(inComponent: 0)
        if (component == 0){
            return String(years[row])
        }else{
            return String(months[row])
        }
    }
    
}

















