//
//  SecondReportViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit


class SecondReportViewController: UIViewController {

    @IBOutlet weak var secondScroll: UIScrollView!
    
    var explain : String = "净值＝资产－负债\n自用项目说明：\n自用贷款：为了购买自用资产而进行的借贷；\n自用性资产：指手机、电脑、相机等个人购买后目的为自用的资产，当使用目的转换为出售，则在售出后按照款项存储方式，归入现金/活存。"
    
    var debt : Double = 0.4 //资产负债率
    var invest : Double = 0.33 //投资与净资产比率
    var repay: Double = 0.67 //清偿比率
    var nowPay: Double = 0.45 //即付比率
    var flow : Double = 0.26 //流动性比率
    var consume : Double = 0.48 //消费比率
    var save : Double = 0.32 //储蓄比率
    
    let color1 = UIColor.init(red: 0x6A/255, green: 0x90/255, blue: 0xCD/255, alpha: 1.0)
    
    
    let color2 = UIColor.init(red: 0x5E/255, green: 0xC9/255, blue: 0xAF/255, alpha: 1.0)
    var wealthAnalyse : String = "财务分析\n\n\n您属于:较高消费人群\n\n餐饮支出占总支出的26.7%，即恩格尔系数26.7%，娱乐支出占总支出的11.4%，交通支出占总支出的2.6%，文教支出占总支出的4.3%，其他支出如恋爱消费占总支出的11.7%餐饮支出和娱乐支出构成了生活支出的主力， 餐饮支出作为最大支出，超过了娱乐支出与其他消费如恋爱消费的总和。\n高投入支出为饮食娱乐，能给自身带来长远效益的相对高产出支出为文教支出，文教支出作为个人发展支出与生活资料、娱乐支出存在一定差异，但占据了合理的比例。\n\n\n"
    
    //var cosumeAdvance : String = "消费建议\n\n\n您的消费水平：较高\n\n您的消费消费特征：总支出较多，消费较为均衡\n\n此类大学生消费趋于多样化且较为均衡，文教类支出最多。建议控制好其他不必要的消费，并且培养一定的理财意识。"
    
    
    let color3 = UIColor.init(red: 0x71/255, green: 0x75/255, blue: 0xD0/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        secondScroll.contentSize = CGSize(width: 412, height:2000)

        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    func setPromt(description: String,yPositon: Int, height: Int,colored: UIColor){
        let explainLabel = UILabel(frame: CGRect(x:0, y: yPositon, width:350 , height: height))
        explainLabel.lineBreakMode = .byWordWrapping
        explainLabel.numberOfLines = 0
        
        explainLabel.text = description
        
        
        explainLabel.textColor = colored
        
        secondScroll.addSubview(explainLabel)
        
    }
    
    //设置各种指数
    func setIndex(description: String,index: String, yPosition: Int, height: Int,width: Int){
        let explainLabel = UILabel(frame: CGRect(x: 0 ,y: yPosition,width: width, height: height))
        explainLabel.text = description
        
        let indexLabel = UILabel(frame: CGRect(x: width, y: yPosition, width: 50, height: height ))
        
        indexLabel.text = index
        
        explainLabel.textColor = UIColor.init(red: 0x62/255, green: 0xC4/255, blue: 0xCB/255, alpha: 1.0)
        indexLabel.textColor = UIColor.init(red: 0x62/255, green: 0xC4/255, blue: 0xCB/255, alpha: 1.0)
        
        secondScroll.addSubview(explainLabel)
        secondScroll.addSubview(indexLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        setPromt(description: explain, yPositon: 370, height: 300,colored: color1)
        setIndex(description: "资产负债率(总负债/总资产)", index: "\(debt)", yPosition: 650, height: 20, width: 300)
        setIndex(description: "投资与净资产比率(投资资产/净资产)", index: "\(invest)", yPosition: 680, height: 20, width: 300)
        setIndex(description: "清偿比率(净资产/总资产)", index: "\(repay)", yPosition: 710, height: 20, width: 300)
        setIndex(description: "即付比率(流动资产/负债总额)", index: "\(nowPay)", yPosition: 740, height: 20, width: 300)
        setIndex(description: "流动性比率(流动资产/每月支出)", index: "\(flow)", yPosition: 770, height: 20, width: 300)
        setIndex(description: "消费比率(月支出/月收入)", index: "\(consume)", yPosition: 800, height: 20, width: 300)
        setIndex(description: "储蓄比率(（月收入-月支出）/月收入)", index: "\(save)", yPosition: 830, height: 20, width: 300)
        setPromt(description: wealthAnalyse, yPositon: 880, height: 350, colored: color2)
        //setPromt(description: cosumeAdvance, yPositon: 1250, height: 350, colored: color3)
        
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 1)
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
