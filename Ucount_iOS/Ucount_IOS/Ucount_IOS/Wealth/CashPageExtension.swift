//
//  CashPageExtension.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import UIKit


extension CashViewController:UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        if viewController is ExpendViewController
        {
            return incomeView
        }

        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        
        if viewController is IncomeViewController
        {
            return expendView
        }

        
        return nil
        
    }
}
