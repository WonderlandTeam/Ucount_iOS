//
//  PageViewExtension_Financial.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/2.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation
import UIKit


extension FinancialViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        if viewController is PushViewController
        {
            return popularViewController
        }
        else if viewController is KnowledgeViewController
        {
            return pushViewController
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        
        if viewController is PopularViewController
        {
            return pushViewController
        }
        else if viewController is PushViewController
        {
            return knowledgeViewController
        }
        
        return nil
        
    }
    
}


