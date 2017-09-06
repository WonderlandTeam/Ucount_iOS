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


    var expendType :[String] = ["饮食","书本","社交","娱乐","日用品","水电费","通讯和网费","交通","电子设备"]
    var expendMoney = [200.0,240.0,100.0,500.0,56,44.8,50,120,300]
    
    var lifeExpend :[String] = ["饮食","日用品","水电费","通讯和网费","交通","电子设备"]
    var lifeExpendMoney = [100.0,56,44.8,50,120,300]
    
    var clothesType :[String] = ["连衣裙","裤子","短袖"]
    var clothesMoney = [400.0,389.0,259.0]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstReportScroll.isScrollEnabled = true //可以上下滚动
        firstReportScroll.scrollsToTop = true //点击状态栏到顶端
        firstReportScroll.bounces = true //反弹效果
        
        beginDate.datePickerMode = .date
        beginDate.locale = Locale(identifier: "zh_CN") //将语言变为中文
        
        endDate.datePickerMode = .date
        endDate.locale = Locale(identifier: "zh_CN")
        
        firstReportScroll.contentSize = CGSize(width: 412,height: 1450)
        
        setExpendPie(showView: firstReportScroll, datapoints: expendType, values: expendMoney)
        
        setLabel(description: "生活必需支出" , yPosition: 720)
        
        setExpendBar(datapoints: lifeExpend,values: lifeExpendMoney,yPosition: 750) //生活必需支出
        
        setLabel(description: "服饰支出分配", yPosition: 980)
        
        setExpendBar(datapoints: clothesType, values: clothesMoney, yPosition: 1020)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    //饼状图支出
    func setExpendPie(showView: UIView,datapoints: [String],values: [Double]){
        var expendPieChart: PieChartView!
        
        expendPieChart = PieChartView.init(frame: CGRect(x: 0,y: 500,width: 350,height: 220))
        

        
        var dataEntries: [PieChartDataEntry] = []
        var totalExpend = 0.0
        
        for i in 0..<datapoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: datapoints[i])
            
            totalExpend = totalExpend + values[i]
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
        expendPieChart.chartDescription?.text = ""
        
        expendPieChart.drawCenterTextEnabled = true
        expendPieChart.centerText = "总支出"+"\(totalExpend)"
        
        expendChartDataSet.xValuePosition = .outsideSlice
        expendChartDataSet.entryLabelColor = NSUIColor.gray
        expendChartDataSet.entryLabelFont = NSUIFont.boldSystemFont(ofSize: 13.0)
        
        expendChartDataSet.valueLinePart1Length = 0.5

        
        expendPieChart.usePercentValuesEnabled = true
        expendPieChart.dragDecelerationEnabled = true
        expendPieChart.holeRadiusPercent = 0.65
        expendPieChart.legend.textColor = NSUIColor.black
        expendPieChart.legend.maxSizePercent = 1
        

        showView.addSubview(expendPieChart)
        
    }
    
    func setExpendBar(datapoints:[String], values:[Double], yPosition: Int){
        var ExpendBarChart : BarChartView!
        
        ExpendBarChart = BarChartView.init(frame: CGRect(x: 0,y: yPosition,width: 350, height: 220))
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<datapoints.count {
            let dataEntry = BarChartDataEntry.init(x: Double(i), y: values[i])
            
            
            dataEntries.append(dataEntry)
        }
        
         let ExpendBarChartDataSet = BarChartDataSet.init(values: dataEntries, label: "")
        
        var colors: [NSUIColor] = []
        for _ in 0..<datapoints.count {
            colors.append(UIColor.randomColor)
        }

        ExpendBarChartDataSet.colors = colors
        
        let ExpendData = BarChartData()
        
        ExpendData.addDataSet(ExpendBarChartDataSet)
        
        ExpendBarChart.data = ExpendData
        
        ExpendBarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: datapoints)
        
        ExpendBarChart.xAxis.granularity = 1
        ExpendBarChart.xAxis.labelPosition = .bottom
        ExpendBarChart.xAxis.drawGridLinesEnabled = false
        
        ExpendBarChart.rightAxis.enabled = false
        
        ExpendBarChart.legend.enabled = false
        
        ExpendBarChart.chartDescription?.text = ""
        
        ExpendBarChart.scaleYEnabled = false
        ExpendBarChart.doubleTapToZoomEnabled = false
        
    
        firstReportScroll.addSubview(ExpendBarChart)
        
    }
    
    
    func setLabel(description: String, yPosition: Int){
        let barTitle = UILabel(frame: CGRect(x: 0,y: yPosition, width:350,height: 50))
        
        barTitle.text = description
        barTitle.textAlignment = .center
        
        firstReportScroll.addSubview(barTitle)
        
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
