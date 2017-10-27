//
//  firstReportExtension.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/10/27.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension FirstReportViewController {
    

    
    //得到收支盈余表的数据
    func getIncomeStatement()  {
       
        Alamofire.request("http://192.168.31.95:8080/api/statements/incomeStatement?username=sigma&beginDate=2017-07-01").responseJSON { response in
            if let json = response.result.value{
                let result = JSON(json)
                print(result)
                
                
                self.incomeMoney.append(result["salary"].doubleValue)
            
                self.incomeMoney.append(result["managementIncome"].doubleValue)
                self.incomeMoney.append(result["alimony"].doubleValue)
                self.incomeMoney.append(result["otherIncome"].doubleValue)
               
                
                self.expendMoney.append(result["necessityTotal"].doubleValue)
                self.expendMoney.append(result["adornTotal"].doubleValue)
                self.expendMoney.append(result["learningTotal"].doubleValue)
                self.expendMoney.append(result["entertainment"].doubleValue)
            self.expendMoney.append(result["managementExpenditure"].doubleValue)
                self.expendMoney.append(result["donationTotal"].doubleValue)
            
                self.expendMoney.append(result["otherExpenditure"].doubleValue)
                
                self.lifeExpendMoney.append(result["diet"].doubleValue)
                self.lifeExpendMoney.append(result["commodity"].doubleValue)
                self.lifeExpendMoney.append(result["utilities"].doubleValue)
                self.lifeExpendMoney.append(result["communication"].doubleValue)
                
               
                self.lifeExpendMoney.append(result["traffic"].doubleValue)
                self.lifeExpendMoney.append(result["electronic"].doubleValue)
                
                self.clothesMoney.append(result["clothing"].doubleValue)
                self.clothesMoney.append(result["cream"].doubleValue)
                self.clothesMoney.append(result["cosmetics"].doubleValue)
                self.clothesMoney.append(result["jewelry"].doubleValue)
                
                
                //给收入饼图传数据
                self.setPie(showView: self.firstReportScroll, datapoints: self.incomeType, values: self.incomeMoney, colors: self.incomeColors, yValue: 100, type: "收入")
                
                //给收入百分比图传数据
                self.setPercentTabel(viewController: self.incomePercent,type: 0, countType: self.incomeType, money: self.incomeMoney, yValue: 450, height: 160)
                
                //给支出饼图传数据
                self.setPie(showView: self.firstReportScroll, datapoints: self.expendType, values: self.expendMoney, colors: self.expendColors, yValue: 880, type: "支出")
                
                //给支出百分比图传数据
                self.setPercentTabel(viewController: self.expendPercent, type: 1, countType: self.expendType, money: self.expendMoney, yValue: 1150, height: 180)
                
                //给生活必需支出柱状图传数据
                self.setExpendBar(datapoints: self.lifeExpend, values: self.lifeExpendMoney, yPosition: 1400)
                
                //给服饰支出柱状图传数据
                self.setExpendBar(datapoints: self.clothesType, values: self.clothesMoney, yPosition: 1700)
                
                
                
                
            }
          
            print("咋回事？？")
            
        }
    }
}
