//
//  budget.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation

struct Budget {
    var type:String
    var money: Float
    var month: Int
    var year: Int
    var left: Float
}

struct Plan {
    var name: String
    var date: String
    var money: Float
    var hasMoney: Float
    var completeDate:String
    var moneyEveryday:Float
}
