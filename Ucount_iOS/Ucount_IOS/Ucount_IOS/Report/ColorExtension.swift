//
//  ColorExtension.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/5.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    //返回随机颜色
    open class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
