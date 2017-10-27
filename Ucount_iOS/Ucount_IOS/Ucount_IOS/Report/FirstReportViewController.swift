//
//  FirstReportViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import Charts
import DateTimePicker
import SkyFloatingLabelTextField


class FirstReportViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstReportScroll: UIScrollView!
    
    @IBOutlet weak var beginDate: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var endDate: SkyFloatingLabelTextFieldWithIcon!
    
    let dateformatter = DateFormatter()
    
    let overcastGreen = UIColor.init(red: 0x5E/255, green: 0xC9/255, blue: 0xAF/255, alpha: 1)
    
    var incomePercent :percentTableViewController!
    var expendPercent :percentTableViewController!
    
    var expendColors: [NSUIColor] = [
    NSUIColor.init(red: 0x99/255, green: 0x66/255, blue: 0x00/255, alpha: 0.8),
    NSUIColor.init(red: 0x00/255, green: 0xCC/255, blue: 0x66/255, alpha: 0.8),
    NSUIColor.init(red: 0x99/255, green: 0xCC/255, blue: 0xFF/255, alpha: 0.8),
    NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0x33/255, alpha: 0.8),
    NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0xCC/255, alpha: 0.8),
    NSUIColor.init(red: 0xFF/255, green: 0x00/255, blue: 0x66/255, alpha: 0.8),
    NSUIColor.init(red: 0xCC/255, green: 0x66/255, blue: 0x66/255, alpha: 0.8)
    
    ]
    var incomeColors: [NSUIColor] = [
    NSUIColor.init(red: 0x33/255, green: 0xCC/255, blue: 0xCC/255, alpha: 0.8),
    NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0xCC/255, alpha: 0.8),
    NSUIColor.init(red: 0xFF/255, green: 0x66/255, blue: 0x00/255, alpha: 0.8),
    NSUIColor.init(red: 0x00/255, green: 0x99/255, blue: 0x33/255, alpha: 0.8)
    ]
    
    
    
//    @IBOutlet weak var beginDate: UIDatePicker!
//    
//    @IBOutlet weak var endDate: UIDatePicker!


    var expendType :[String] = ["必需","服饰","学习","娱乐","理财","捐赠","其他"]

    
    
    //var expendMoney = [200.0,240.0,100.0,500.0,56,44.8,50]
    var expendMoney = [Double]()
    var incomeType :[String] = ["工资","理财","补助","其他"]
    //var incomeMoney = [400.0,200.0,500.0,300.0]
    var incomeMoney = [Double]()
    
    var lifeExpend :[String] = ["饮食","日用品","水电费","通讯和网费","交通","电子设备"]
    //var lifeExpendMoney = [100.0,56,44.8,50,120,300]
    var lifeExpendMoney = [Double]()
    
    var clothesType :[String] = ["衣帽鞋包","护肤品","彩妆","首饰"]
    //var clothesMoney = [400.0,389.0,259.0,469.0]
    var clothesMoney = [Double]()
    
    
    
    var incomePieDes = "  工资收入包括校内勤工俭学、校内工作补贴和兼职工资等多项劳动性收入，体现用户的个人劳动所得。“理财收入”作为衡量用户使用理财产品或通过理财工具获得收入的能力的重要判断要素。“家庭补助”多为来自家长的生活费补贴。其他收入考虑到了大学生额外收入的情况，展现了大学生的主要收入来源情况。"

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //收支盈余表的数据传输
        getIncomeStatement()
        
        
        incomePercent = UIStoryboard(name:"Report",bundle:nil).instantiateViewController(withIdentifier: "tabelPercent") as! percentTableViewController
        
        
        
        expendPercent = UIStoryboard(name:"Report",bundle:nil).instantiateViewController(withIdentifier: "tabelPercent") as! percentTableViewController
        
        
        
        firstReportScroll.isScrollEnabled = true //可以上下滚动
        firstReportScroll.scrollsToTop = true //点击状态栏到顶端
        firstReportScroll.bounces = true //反弹效果
        
//        beginDate.datePickerMode = .date
//        beginDate.locale = Locale(identifier: "zh_CN") //将语言变为中文
//        
//        endDate.datePickerMode = .date
//        endDate.locale = Locale(identifier: "zh_CN")
        
        firstReportScroll.contentSize = CGSize(width: 412,height: 2400)
        
      //  setPie(showView: firstReportScroll, datapoints: incomeType, values: incomeMoney, colors: incomeColors, yValue: 100, type: "收入")
        
       // setPercentTabel(viewController: incomePercent,type: 0, countType: incomeType, money: incomeMoney, yValue: 450, height: 160)
        
        setDescription(description: incomePieDes, yPosition: 630, height: 200)

        
       // setPie(showView: firstReportScroll, datapoints: expendType, values: expendMoney,colors: expendColors,yValue: 880,type: "支出")
        
        //setPercentTabel(viewController: expendPercent,type: 1, countType: expendType, money: expendMoney, yValue: 1150, height: 180)
        
        setLabel(description: "生活必需支出" , yPosition: 1350)
        
        //setExpendBar(datapoints: lifeExpend,values: lifeExpendMoney,yPosition: 1400) //生活必需支出
        
        setLabel(description: "服饰支出分配", yPosition: 1650)
        
        //setExpendBar(datapoints: clothesType, values: clothesMoney, yPosition: 1700)
        

        

        beginDate.delegate = self
        endDate.delegate = self
        
        
        
        beginDate.placeholder = "开始日期"
        beginDate.title = "开始日期"
        endDate.placeholder = "结束日期"
        endDate.title = "结束日期"
        
        beginDate.iconFont = UIFont(name: "FontAwesome", size: 15)
        endDate.iconFont = UIFont(name: "FontAwesome", size: 15)
        beginDate.iconText = "\u{f073}"
        endDate.iconText = "\u{f073}"
        beginDate.iconMarginBottom = -3
        endDate.iconMarginBottom = -3
        
        beginDate.lineColor = overcastGreen
        endDate.lineColor = overcastGreen
        
        beginDate.titleColor = overcastGreen
        endDate.titleColor = overcastGreen

        

        
        // Do any additional setup after loading the view.
    }
    

    

    
    
    //饼状图支出
    func setPie(showView: UIView,datapoints: [String],values: [Double],colors:[NSUIColor],yValue: Int,type: String){
        var pieChart: PieChartView!
        
        pieChart = PieChartView.init(frame: CGRect(x: 0,y: yValue,width: 350,height: 220))
        

        
        var dataEntries: [PieChartDataEntry] = []
        var total = 0.0
        
        for i in 0..<datapoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: datapoints[i])
            
            total = total + values[i]
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = PieChartDataSet.init(values: dataEntries, label: "")
        
        
        chartDataSet.colors = colors //区块的颜色
        
        let pieData = PieChartData()
        pieData.addDataSet(chartDataSet)
        
        pieChart.data = pieData
        pieChart.chartDescription?.text = ""
        
        pieChart.drawCenterTextEnabled = true
        if(type == "支出"){
            pieChart.centerText = "总支出"+"\(total)"
        }else{
            pieChart.centerText = "总收入"+"\(total)"
        }
        
        
        chartDataSet.xValuePosition = .outsideSlice
        chartDataSet.entryLabelColor = NSUIColor.gray
        chartDataSet.entryLabelFont = NSUIFont.boldSystemFont(ofSize: 13.0)
        
        chartDataSet.valueLinePart1Length = 0.5

        
       // expendPieChart.usePercentValuesEnabled = true
        pieChart.dragDecelerationEnabled = true
        pieChart.holeRadiusPercent = 0.55
        pieChart.legend.textColor = NSUIColor.black
        pieChart.legend.maxSizePercent = 1
        

        showView.addSubview(pieChart)
        
    }
    
    func setExpendBar(datapoints:[String], values:[Double], yPosition: Int){
        var ExpendBarChart : BarChartView!
       // print("receive : "+"\(values)")
        ExpendBarChart = BarChartView.init(frame: CGRect(x: 0,y: yPosition,width: 350, height: 220))
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<datapoints.count {
            let dataEntry = BarChartDataEntry.init(x: Double(i), y: values[i])
            
            
            dataEntries.append(dataEntry)
        }
        
         let ExpendBarChartDataSet = BarChartDataSet.init(values: dataEntries, label: "")
        
        var colors: [NSUIColor] = []
        
        var candiColors : [NSUIColor] = [
            NSUIColor.init(red: 0x5E/255, green: 0xC9/255, blue: 0xAF/255, alpha: 1),
            NSUIColor.init(red: 0xC6/255, green: 0xE4/255, blue: 0xEC/255, alpha: 1),
            NSUIColor.init(red: 0x9F/255, green: 0xB5/255, blue: 0xDF/255, alpha: 1),
            NSUIColor.init(red: 0xD7/255, green: 0x88/255, blue: 0xB7/255, alpha: 1),
            NSUIColor.init(red: 0x85/255, green: 0xC5/255, blue: 0xD6/255, alpha: 1),
            NSUIColor.init(red: 0xE4/255, green: 0xE8/255, blue: 0xBA/255, alpha: 1)
        ]
        
        for i in 0..<datapoints.count {
            colors.append(candiColors[i])
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
    
    func setDescription(description: String, yPosition: Int, height: Int){
        let pieDes = UILabel(frame: CGRect(x:0,y: yPosition, width:380,height: height))
        
        pieDes.text = description
        
        pieDes.numberOfLines = 7
        
        pieDes.textColor = UIColor.init(red: 0x85/255, green: 0xC5/255, blue: 0xD6/255, alpha: 0.8)
        
        firstReportScroll.addSubview(pieDes)
        
    }
    
    
    func setLabel(description: String, yPosition: Int){
        let barTitle = UILabel(frame: CGRect(x: 0,y: yPosition, width:350,height: 50))
        
        barTitle.text = description
        barTitle.textColor = UIColor.init(red: 0x62/255, green: 0xC4/255, blue: 0xCB/255, alpha: 0.9)
        barTitle.textAlignment = .center
        
        firstReportScroll.addSubview(barTitle)
        
    }
    
    
    
    
    //设置饼状图下方的百分比说明, type（0代表收入,1代表支出）, countType代表具体支出／收入类型，money代表相对应的金额
    func setPercentTabel(viewController: percentTableViewController,type: Int ,countType: [String], money: [Double],yValue: Int, height: Int){
        
        viewController.type = type
        viewController.countType = countType
        viewController.countMoney = money
        viewController.yValue = yValue
        viewController.heightValue = height
        
        firstReportScroll.addSubview(viewController.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


    
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        dateformatter.dateStyle = .short
        
        let picker = DateTimePicker.show()
        var dateTime : Date = Date()
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.isDatePickerOnly = true // to hide time and show only date picker
        
        picker.completionHandler = { date in
            // do something after tapping done
             dateTime = date
            if(textField.tag == 1)
            {
                //print("开始日期")
                self.beginDate.text = self.dateformatter.string(from: dateTime)
                
            }
                //结束日期
            else
            {
                //print("结束日期")
                self.endDate.text = self.dateformatter.string(from: dateTime)

                
            }

            //print(dateTime)
        }
        
        
        
        
        
        
        return true
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
