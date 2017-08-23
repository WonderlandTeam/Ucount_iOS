//
//  CreateNewExtension.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/23.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

extension CreateNewController : UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return countType.count
    }
}

extension CreateNewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return countType[row]
        
    }
}
