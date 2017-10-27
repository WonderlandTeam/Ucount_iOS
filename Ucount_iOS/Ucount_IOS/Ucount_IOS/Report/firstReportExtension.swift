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
        print("zhunbeile")
        Alamofire.request("http://172.19.118.71:8080/api/statements/incomeStatement?username=sigma&beginDate=2017-07-01").responseJSON { response in
            if let json = response.result.value{
                let result = JSON(json)
                print(result)
                self.incomeMoney.append(result["diet"].doubleValue)
                self.incomeMoney.append(result["alimony"].doubleValue)
                self.incomeMoney.append(result["otherIncome"].doubleValue)
                self.incomeMoney.append(result["salary"].doubleValue)
                print("incomeMoney" + "\(self.incomeMoney[0])")
                self.setPercentTabel(viewController: self.incomePercent,type: 0, countType: self.incomeType, money: self.incomeMoney, yValue: 450, height: 160)
                
                print("啥也没有")
                
            }
            print("出来了")
            
        }
    }
}
