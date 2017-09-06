//
//  incomePieViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/4.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import Charts

class incomePieViewController: UIViewController {

    
    var incomeType :[String] = ["工资","理财","补助","其他"]
    var incomeMoney = [400.0,200.0,500.0,300.0]
    
    @IBOutlet weak var incomePieChart: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(dataPoints: incomeType, values: incomeMoney)
        incomePieChart.noDataText = "没有可展示的数据"
        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
       var dataEntries: [PieChartDataEntry] = []
        
        var totalIncome = 0.0
        
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: dataPoints[i])
            totalIncome = totalIncome+values[i]
            
            dataEntries.append(dataEntry)
        }
        
        let incomeChartDataSet = PieChartDataSet.init(values: dataEntries, label: "")
        
        
        let Piedata = PieChartData()
        Piedata.addDataSet(incomeChartDataSet)
        
        
        var colors: [NSUIColor] = []
        colors.append(NSUIColor.init(red: 0x33/255, green: 0xCC/255, blue: 0xCC/255, alpha: 0.5))
        colors.append(NSUIColor.init(red: 0xFF/255, green: 0x99/255, blue: 0xCC/255, alpha: 0.5))
        colors.append(NSUIColor.init(red: 0xFF/255, green: 0x66/255, blue: 0x00/255, alpha: 0.5))
        colors.append(NSUIColor.init(red: 0x00/255, green: 0x99/255, blue: 0x33/255, alpha: 0.5))
        
        
        incomeChartDataSet.colors = colors //区块的颜色
        
        incomeChartDataSet.xValuePosition = .outsideSlice
        incomeChartDataSet.entryLabelColor = NSUIColor.gray
        incomeChartDataSet.entryLabelFont = NSUIFont.boldSystemFont(ofSize: 13.0)
        
        incomeChartDataSet.valueLinePart1Length = 0.7
        
        incomePieChart.data = Piedata //先设置颜色再设置data才能显示全部图例
        incomePieChart.chartDescription?.text = ""
        
        incomePieChart.drawCenterTextEnabled = true
        incomePieChart.centerText = "总收入"+"\(totalIncome)"
        
        
        incomePieChart.usePercentValuesEnabled = true
        incomePieChart.dragDecelerationEnabled = true
        incomePieChart.holeRadiusPercent = 0.65
        
        
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

