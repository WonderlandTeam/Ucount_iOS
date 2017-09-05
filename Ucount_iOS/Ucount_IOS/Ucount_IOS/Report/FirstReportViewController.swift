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


    var expendType :[String] = ["餐饮","书本","社交","娱乐"]
    var expendMoney = [200.0,240.0,100.0,500.0]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstReportScroll.isScrollEnabled = true //可以上下滚动
        firstReportScroll.scrollsToTop = true //点击状态栏到顶端
        firstReportScroll.bounces = true //反弹效果
        
        beginDate.datePickerMode = .date
        beginDate.locale = Locale(identifier: "zh_CN") //将语言变为中文
        
        endDate.datePickerMode = .date
        endDate.locale = Locale(identifier: "zh_CN")
        
        firstReportScroll.contentSize = CGSize(width: 412,height: 1500)
        
        setExpendPie(showView: firstReportScroll, datapoints: expendType, values: expendMoney)
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    //饼状图支出
    func setExpendPie(showView: UIView,datapoints: [String],values: [Double]){
        var expendPieChart: PieChartView!
        
        expendPieChart = PieChartView.init(frame: CGRect(x: 0,y: 450,width: 350,height: 200))
        

        
        var dataEntries: [PieChartDataEntry] = []
        
        for i in 0..<datapoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: datapoints[i])
            
            
            dataEntries.append(dataEntry)
        }
        
        let expendChartDataSet = PieChartDataSet.init(values: dataEntries, label: "")
        
        
 
        
        var colors: [NSUIColor] = []
        for _ in 0..<datapoints.count {
            colors.append(UIColor.randomColor)
        }
        
        expendChartDataSet.colors = colors //区块的颜色
        
        let Piedata = PieChartData()
        Piedata.addDataSet(expendChartDataSet)
        
        expendPieChart.data = Piedata
        expendPieChart.chartDescription?.text = "支出百分比图示"
        
        expendChartDataSet.xValuePosition = .outsideSlice
        expendChartDataSet.entryLabelColor = NSUIColor.black

        
        expendPieChart.usePercentValuesEnabled = true
        expendPieChart.dragDecelerationEnabled = true
        expendPieChart.holeRadiusPercent = 0.3
        expendPieChart.legend.textColor = NSUIColor.black
        expendPieChart.legend.maxSizePercent = 1
        
        
       

        showView.addSubview(expendPieChart)
        
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
