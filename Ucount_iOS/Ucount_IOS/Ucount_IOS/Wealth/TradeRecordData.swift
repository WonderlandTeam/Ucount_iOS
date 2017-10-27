//
//  TradeRecordData.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/10/25.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension TradeRecordViewController{
    
    func test()  {
        print("zhunbeile")
        Alamofire.request("http://172.19.118.71:8080/api/accounts/2").responseJSON { response in
            if let json = response.result.value{
                let result = JSON(json)
                print(result)
                print("啥也没有")
                
            }
        print("出来了")
            
    }
}
}
