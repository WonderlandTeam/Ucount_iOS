//
//  PlanViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/2.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {

    var budgetView = BudgetViewController()
    var saveView = SaveViewController()
    
    @IBOutlet weak var sliderView: UIView!
    
    var pageViewController: UIPageViewController!
    
    var controllers = [UIViewController]()
    
    var sliderImage: UIImageView!
    
    @IBOutlet weak var budgetButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    //添加两个变量索引当前page和上一个page
    var lastPage = 0
    var currentPage = 0 {
        didSet{
            //根据当前页面计算得到便宜量
            //一个微小的动画移动提示条
            let offset = self.view.frame.width / 2.0 * CGFloat(currentPage)
            
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
        
        budgetView = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "budgetView") as! BudgetViewController
        saveView = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "saveView") as! SaveViewController
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([budgetView], direction: .forward, animated: true, completion: nil)
        
        controllers.append(budgetView)
        controllers.append(saveView)
        
        //添加提示条
        sliderImage = UIImageView(frame: CGRect(x: 0 , y: -1 , width: self.view.frame.width / 2.0, height: 3.0))
        sliderImage.image = UIImage(named: "slider_green")
        sliderView.addSubview(sliderImage)
        
        NotificationCenter.default.addObserver(self, selector: #selector(PlanViewController.currentPageChangedFunc(notification:)), name: NSNotification.Name( "currentPageChanged"), object: nil)
        
        self.budgetButton.setTitleColor(UIColor(red: 188/255, green: 236/255, blue: 189/255, alpha: 1), for: UIControlState.normal )
        self.saveButton.setTitleColor(UIColor(red: 188/255, green: 236/255, blue: 189/255, alpha: 1), for: UIControlState.normal )
        
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
    

}
