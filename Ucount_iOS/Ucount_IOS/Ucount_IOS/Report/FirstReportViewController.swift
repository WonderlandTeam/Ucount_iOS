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
    
    
    
//    @IBOutlet weak var beginDate: UIDatePicker!
//    
//    @IBOutlet weak var endDate: UIDatePicker!


    var expendType :[String] = ["必需","服饰","学习","娱乐","理财","捐赠","其他"]
    var expendMoney = [200.0,240.0,100.0,500.0,56,44.8,50]
    
    var incomeType :[String] = ["工资","理财","补助","其他"]
    var incomeMoney = [400.0,200.0,500.0,300.0]

    
    var lifeExpend :[String] = ["饮食","日用品","水电费","通讯和网费","交通","电子设备"]
    var lifeExpendMoney = [100.0,56,44.8,50,120,300]
    
    var clothesType :[String] = ["连衣裙","裤子","短袖"]
    var clothesMoney = [400.0,389.0,259.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        firstReportScroll.contentSize = CGSize(width: 412,height: 2200)
        
        setPercentTabel(viewController: incomePercent,type: 0, countType: incomeType, money: incomeMoney, yValue: 450, height: 220)
        
        setExpendPie(showView: firstReportScroll, datapoints: expendType, values: expendMoney)
        
        setPercentTabel(viewController: expendPercent,type: 1, countType: expendType, money: expendMoney, yValue: 900, height: 180)
        
        setLabel(description: "生活必需支出" , yPosition: 1100)
        
        setExpendBar(datapoints: lifeExpend,values: lifeExpendMoney,yPosition: 1200) //生活必需支出
        
        setLabel(description: "服饰支出分配", yPosition: 1450)
        
        setExpendBar(datapoints: clothesType, values: clothesMoney, yPosition: 1550)
        

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
    func setExpendPie(showView: UIView,datapoints: [String],values: [Double]){
        var expendPieChart: PieChartView!
        
        expendPieChart = PieChartView.init(frame: CGRect(x: 0,y: 650,width: 350,height: 220))
        

        
        var dataEntries: [PieChartDataEntry] = []
        var totalExpend = 0.0
        
        for i in 0..<datapoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: datapoints[i])
            
            totalExpend = totalExpend + values[i]
            dataEntries.append(dataEntry)
        }
        
        let expendChartDataSet = PieChartDataSet.init(values: dataEntries, label: "")
        
        
        var colors: [NSUIColor] = []
        
        colors.append(NSUIColor.init(red: 0x99/255, green: 0x66/255, blue: 0x00/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0x00/255, green: 0xCC/255, blue: 0x66/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0x99/255, green: 0xCC/255, blue: 0xFF/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0x33/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0xCC/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0xFF/255, green: 0x00/255, blue: 0x66/255, alpha: 0.8))
        colors.append(NSUIColor.init(red: 0xCC/255, green: 0x66/255, blue: 0x66/255, alpha: 0.8))
        
        
        
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

        
       // expendPieChart.usePercentValuesEnabled = true
        expendPieChart.dragDecelerationEnabled = true
        expendPieChart.holeRadiusPercent = 0.55
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
                print("开始日期")
                self.beginDate.text = self.dateformatter.string(from: dateTime)
                
            }
                //结束日期
            else
            {
                print("结束日期")
                self.endDate.text = self.dateformatter.string(from: dateTime)

                
            }

            print(dateTime)
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
