//
//  ReportViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    var pageViewController : UIPageViewController!
    
    var firstReport : FirstReportViewController!
    var secondReport : SecondReportViewController!
    var thirdReport : ThirdReportViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.childViewControllers.first as! UIPageViewController
        // Do any additional setup after loading the view.
        firstReport = UIStoryboard(name:"Report", bundle:nil).instantiateViewController(withIdentifier: "firstReport")
        as! FirstReportViewController
        
        secondReport = UIStoryboard(name :"Report", bundle:nil).instantiateViewController(withIdentifier: "secondReport")
        as! SecondReportViewController
        
        thirdReport = UIStoryboard(name:"Report", bundle:nil).instantiateViewController(withIdentifier: "thirdReport")
        as! ThirdReportViewController
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([firstReport], direction: .forward, animated: true, completion: nil)
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
