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

    
    var incomeType :[String] = ["理财收入","其他收入","工资收入"]
    var incomeMoney = [400.0,200.0,500.0]
    
    @IBOutlet weak var incomePieChart: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(dataPoints: incomeType, values: incomeMoney)
        incomePieChart.noDataText = "没有可展示的数据"
        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
       var dataEntries: [PieChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry.init(value: values[i], label: dataPoints[i])
            
            
            dataEntries.append(dataEntry)
        }
        
        let incomeChartDataSet = PieChartDataSet.init(values: dataEntries, label: "")
        
        
        let Piedata = PieChartData()
        Piedata.addDataSet(incomeChartDataSet)
        
        
        var colors: [NSUIColor] = []
        for _ in 0..<dataPoints.count {
            colors.append(UIColor.randomColor)
        }
        
        incomeChartDataSet.colors = colors //区块的颜色
        
        incomeChartDataSet.xValuePosition = .outsideSlice
        incomeChartDataSet.entryLabelColor = NSUIColor.black
        
        incomeChartDataSet.valueLinePart1Length = 0.7
        
        incomePieChart.data = Piedata //先设置颜色再设置data才能显示全部图例
        incomePieChart.chartDescription?.text = ""
        
        incomePieChart.drawCenterTextEnabled = true
        incomePieChart.centerText = "收入"
        
        
        incomePieChart.usePercentValuesEnabled = true
        incomePieChart.dragDecelerationEnabled = true
        incomePieChart.holeRadiusPercent = 0.3
        
        
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

