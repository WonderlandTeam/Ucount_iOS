//
//  FirstReportViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import Charts

class FirstReportViewController: UIViewController {

    @IBOutlet weak var firstReportScroll: UIScrollView!
    
    
    @IBOutlet weak var beginDate: UIDatePicker!
    
    @IBOutlet weak var endDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstReportScroll.isScrollEnabled = true //可以上下滚动
        firstReportScroll.scrollsToTop = true //点击状态栏到顶端
        firstReportScroll.bounces = true //反弹效果
        
//        beginDate.frame = CGRectMake(0,0,100,100)
        beginDate.datePickerMode = .date
        beginDate.locale = Locale(identifier: "zh_CN") //将语言变为中文
        
        endDate.datePickerMode = .date
        endDate.locale = Locale(identifier: "zh_CN")
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
