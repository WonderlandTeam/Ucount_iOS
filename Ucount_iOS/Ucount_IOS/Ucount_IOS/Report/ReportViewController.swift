//
//  ReportViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var thirdReportButton: UIButton!
    @IBOutlet weak var secondReportButton: UIButton!
    @IBOutlet weak var firstReportButton: UIButton!
    
    @IBOutlet weak var sliderView: UIView!
    var pageViewController : UIPageViewController!
    
    var firstReport : FirstReportViewController!
    var secondReport : SecondReportViewController!
    var thirdReport : ThirdReportViewController!
    
    var controllers = [UIViewController]() //controller的集合
    
    var sliderImage : UIImageView!
    
    //添加两个变量索引当前page和上一个page
    var lastPage = 0
    var currentPage = 0 {
        didSet{
            //根据当前页面计算得到便宜量
            //一个微小的动画移动提示条
            let offset = self.view.frame.width / 3.0 * CGFloat(currentPage)
            
            UIView.animate(withDuration: 0.3, animations: {
                () -> Void in
                self.sliderView.frame.origin = CGPoint(x: offset, y: 95)
            })
            //根据currentPage 和 lastPage的大小关系，控制页面的切换方向
            if currentPage > lastPage {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
            }
            else {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .reverse, animated: true, completion: nil)
            }
            
            lastPage = currentPage
            

        }
    }
    
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
        
        controllers.append(firstReport)
        controllers.append(secondReport)
        controllers.append(thirdReport)
        
        
        self.firstReportButton.setTitleColor(UIColor(red:46/255, green: 204/255, blue: 113/255, alpha: 1), for: UIControlState.normal )
        
        self.secondReportButton.setTitleColor(UIColor(red:46/255, green: 204/255, blue: 113/255, alpha: 1), for: UIControlState.normal )
        
        self.thirdReportButton.setTitleColor(UIColor(red:46/255, green: 204/255, blue: 113/255, alpha: 1), for: UIControlState.normal )
        
        //添加提示条 
        sliderImage = UIImageView(frame: CGRect(x: 0 , y: -1 , width: self.view.frame.width / 3.0, height: 3.0))
        sliderImage.image = UIImage(named: "slider_green")
        sliderView.addSubview(sliderImage)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ReportViewController.currentPageChangedFunc(notification:)), name: NSNotification.Name( "currentPageChanged"), object: nil)
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func changeCurrentPage(_ sender: UIButton) {
        currentPage = sender.tag - 20
    }
    
    //通知响应方法
    func currentPageChangedFunc(notification: NSNotification) {
        currentPage = notification.object as! Int
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
