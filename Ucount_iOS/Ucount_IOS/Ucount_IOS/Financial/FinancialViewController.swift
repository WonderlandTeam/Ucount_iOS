//
//  FinancialViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/20.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class FinancialViewController: UIViewController {
    
    var popularViewController = PopularViewController()
    var pushViewController = PushViewController()
    var knowledgeViewController = KnowledgeViewController()
    
    @IBOutlet weak var sliderView: UIView!
    
    var pageViewController: UIPageViewController!
    
    var controllers = [UIViewController]()
    
    var sliderImage: UIImageView!
    
    @IBOutlet weak var popularButton: UIButton!
    
    @IBOutlet weak var pushButton: UIButton!
    
    @IBOutlet weak var knowButton: UIButton!
    
    
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

        
        popularViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "PopularViewController") as! PopularViewController
        pushViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "PushViewController") as! PushViewController
        knowledgeViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "KnowledgeViewController") as! KnowledgeViewController
        
    
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([popularViewController], direction: .forward, animated: true, completion: nil)
        
        controllers.append(popularViewController)
        controllers.append(pushViewController)
        controllers.append(knowledgeViewController)
        
        //添加提示条
        sliderImage = UIImageView(frame: CGRect(x: 0 , y: -1 , width: self.view.frame.width / 3.0, height: 3.0))
        sliderImage.image = UIImage(named: "slider_green")
        sliderView.addSubview(sliderImage)
        
        NotificationCenter.default.addObserver(self, selector: #selector(FinancialViewController.currentPageChangedFunc(notification:)), name: NSNotification.Name( "currentPageChanged"), object: nil)
        
        self.popularButton.setTitleColor(UIColor(red: 188/255, green: 236/255, blue: 189/255, alpha: 1), for: UIControlState.normal )
        self.pushButton.setTitleColor(UIColor(red: 188/255, green: 236/255, blue: 189/255, alpha: 1), for: UIControlState.normal )
        self.knowButton.setTitleColor(UIColor(red: 188/255, green: 236/255, blue: 189/255, alpha: 1), for: UIControlState.normal )
        
        
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



