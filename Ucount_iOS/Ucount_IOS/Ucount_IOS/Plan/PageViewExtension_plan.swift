//
//  PageViewExtension_plan.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/2.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import UIKit


extension PlanViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        if viewController is SaveViewController
        {
            return budgetView
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        
        if viewController is BudgetViewController
        {
            return saveView
        }
        
        return nil
        
    }
    
}



