//
//  PageViewExtension.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import UIKit


extension ReportViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        if viewController is SecondReportViewController
        {
            return firstReport
        }
        else if viewController is ThirdReportViewController
        {
            return secondReport
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        
        if viewController is FirstReportViewController
        {
            return secondReport
        }
        else if viewController is SecondReportViewController
        {
            return thirdReport
        }
        
        return nil

    }
    
}
