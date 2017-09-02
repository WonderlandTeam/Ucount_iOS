//
//  CashViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class CashViewController: UIViewController {
    @IBOutlet weak var typeIcon: UIImageView!
   
    @IBOutlet weak var sliderView: UIView!
    
    var pageViewController : UIPageViewController!
    
    var incomeView : IncomeViewController!
    var expendView : ExpendViewController!
    
    var controllers = [UIViewController]() //controller的集合
    
    var sliderImage : UIImageView!
    
    //添加两个变量索引当前page和上一个page
    var lastPage = 0
    var currentPage = 0 {
        didSet{
            //根据当前页面计算得到便宜量
            //一个微小的动画移动提示条
            let offset = self.view.frame.width / 2.0 * CGFloat(currentPage)
            
            UIView.animate(withDuration: 0.3, animations: {
                () -> Void in
                self.sliderView.frame.origin = CGPoint(x: offset, y: 86)
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
    
    var iconName: String? //要显示的图标类型
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        incomeView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "incomeView") as! IncomeViewController
        
        expendView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "expendView") as! ExpendViewController
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([incomeView], direction: .forward, animated: true, completion: nil)
        
        //添加提示条
        sliderImage = UIImageView(frame: CGRect(x: 0 , y: -1 , width: self.view.frame.width / 2.0 , height: 3.0))
        sliderImage.image = UIImage(named: "slider")
        sliderView.addSubview(sliderImage)
        
        controllers.append(incomeView)
        controllers.append(expendView)
        
        

        
        NotificationCenter.default.addObserver(self, selector: #selector(CashViewController.currentPageChangedFunc(notification:)), name: NSNotification.Name( "currentPageChanged"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CashViewController.printIconChangedFucn(notification:)), name: NSNotification.Name( "printIcon"), object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func changeCurrentPage(_ sender: UIButton) {
        currentPage = sender.tag - 20
    }
    
    //通知page改变响应方法
    func currentPageChangedFunc(notification: NSNotification) {
        currentPage = notification.object as! Int
    }
    
    //通知消费类型图标改变
    func printIconChangedFucn(notification: NSNotification){
        iconName = notification.object as? String
        typeIcon.image = UIImage(named: iconName!)
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
