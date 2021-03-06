//
//  CashViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CashViewController: UIViewController {
    @IBOutlet weak var typeIcon: UIImageView!
   
    @IBOutlet weak var countCash: SkyFloatingLabelTextField!
    @IBOutlet weak var sliderView: UIView!
    
    @IBOutlet weak var expendButton: UIButton!
    @IBOutlet weak var incomeButton: UIButton!
    
    @IBOutlet weak var recordExplain: SkyFloatingLabelTextFieldWithIcon!
    
    let overcastGreen = UIColor.init(red: 0x5E/255, green: 0xC9/255, blue: 0xAF/255, alpha: 1)
    
    typealias closureBlock = ([Int:String]) -> Void
    
    var sendToWealth : closureBlock? //回传数据
    
    var pageViewController : UIPageViewController!
    
    var incomeView : IncomeViewController!
    var expendView : ExpendViewController!
    
    var controllers = [UIViewController]() //controller的集合
    
    var sliderImage : UIImageView!
    
    //添加两个变量索引当前page和上一个page
    var lastCashPage = 0
    var currentCashPage = 0 {
        didSet{
            //根据当前页面计算得到便宜量
            //一个微小的动画移动提示条
            let offset = self.view.frame.width / 2.0 * CGFloat(currentCashPage)
            
            UIView.animate(withDuration: 0.3, animations: {
                () -> Void in
                self.sliderView.frame.origin = CGPoint(x: offset, y: 86)
            })
            //根据currentPage 和 lastPage的大小关系，控制页面的切换方向
            if currentCashPage > lastCashPage {
                self.pageViewController.setViewControllers([controllers[currentCashPage]], direction: .forward, animated: true, completion: nil)
            }
            else {
                self.pageViewController.setViewControllers([controllers[currentCashPage]], direction: .reverse, animated: true, completion: nil)
            }
            
            lastCashPage = currentCashPage
            
            
        }
    }
    
    var iconName: String? //要显示的图标类型
    
    var recordInfo = [Int:String]() //用来记录每一次的交易详情 0代表是收入还是支出，1代表具体类型，2代表金额，3代表备注，4代表时间
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        incomeView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "incomeView") as! IncomeViewController
        
        expendView = UIStoryboard(name:"Wealth",bundle:nil).instantiateViewController(withIdentifier: "expendView") as! ExpendViewController
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([incomeView], direction: .forward, animated: true, completion: nil)
        
        //添加提示条
        sliderImage = UIImageView(frame: CGRect(x: 0 , y: -1 , width: self.view.frame.width / 2.0 , height: 3.0))
        sliderImage.image = UIImage(named: "slider_green")
        sliderView.addSubview(sliderImage)
        
        controllers.append(incomeView)
        controllers.append(expendView)
        
        //更改按钮颜色
        
        self.incomeButton.setTitleColor(UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1), for: UIControlState.normal )
        self.expendButton.setTitleColor(UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1), for: UIControlState.normal )
        
        

        
        NotificationCenter.default.addObserver(self, selector: #selector(CashViewController.currentPageChangedFunc(notification:)), name: NSNotification.Name( "currentCashPageChanged"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CashViewController.printIconChangedFucn(notification:)), name: NSNotification.Name( "printIcon"), object: nil)
        // Do any additional setup after loading the view.
        
        countCash.title = "金额"
        countCash.selectedTitleColor = overcastGreen
        countCash.selectedLineColor = overcastGreen
        countCash.tintColor = overcastGreen
        
        recordExplain.title = "备注信息"
        recordExplain.selectedTitleColor = overcastGreen
        recordExplain.selectedLineColor = overcastGreen
        recordExplain.tintColor = overcastGreen
        
        recordExplain.iconFont = UIFont.init(name: "FontAwesome", size: 15)
        recordExplain.iconText = "\u{f23a}"
        recordExplain.iconMarginBottom = -3

        
//        countCash.iconFont = UIFont.init(name: "FontAwesome", size: 13)
//        countCash.iconText = "\u{f0d6}"
//        countCash.iconMarginBottom = -3
//
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countCash.text = ""
        recordExplain.text = ""
    }
    
    @IBAction func back(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func changeCurrentPage(_ sender: UIButton) {
        currentCashPage = sender.tag - 20
    }
    
    //通知page改变响应方法
    func currentPageChangedFunc(notification: NSNotification) {
        currentCashPage = notification.object as! Int
    }
    
    //通知消费类型图标改变
    func printIconChangedFucn(notification: NSNotification){
        iconName = notification.object as? String
        typeIcon.image = UIImage(named: iconName!)
    }
    
    @IBAction func sendRecord(_ sender: UIButton){
        
        let now = Date() //获取当前时间   
        
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年\nMM月dd日\nHH:mm"
        
        
        let confirmAction = UIAlertAction(title: "确定",style : .default,handler: nil)
        
        if (countCash.text == "")
        {
            let alertName = UIAlertController(title : "系统提示",
                                              message: "请输入金额",preferredStyle: .alert)
            
            
            alertName.addAction(confirmAction)
            self.present(alertName, animated: true, completion: nil)
            
        }
        else
        {
            if currentCashPage == 0{
                recordInfo[0] = "收入"
            }
            else{
                recordInfo[0] = "支出"
            }
            

            recordInfo[2] = countCash.text
            if(iconName != nil)
            {
                recordInfo[1] = iconName!
            }
            
            recordInfo[3] = recordExplain.text
            recordInfo[4] = dformatter.string(from: now)
            
            if sendToWealth != nil{
                sendToWealth?(recordInfo)
            }
            let alertSuccess = UIAlertController(title: "系统提示",message: "保存成功！",preferredStyle: .alert)
            
            
            self.present(alertSuccess, animated: true, completion: nil)
            
            self.presentingViewController?.dismiss(animated: true, completion: nil)

        }
        
        
        
        
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
