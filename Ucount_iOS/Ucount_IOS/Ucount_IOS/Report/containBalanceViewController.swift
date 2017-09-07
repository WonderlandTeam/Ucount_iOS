//
//  containBalanceViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/7.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class containBalanceViewController: UIViewController {

    var gridViewController: balanceViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridViewController = balanceViewController()
        gridViewController.setColumns(columns: ["资产项目","成本", "市价", "负债项目", "金额","净值项目","成本","市价"])
        gridViewController.addRow(row: ["现金","  ", "  ", "信用卡负债", "  ","  ","  "," "])
        gridViewController.addRow(row: ["活存","  ", "  ", "  ", "  ","  ","  "," "])
        gridViewController.addRow(row: ["流动资产","  ", "  ", "消费负债", "流动净值","  ","  "," "])
        gridViewController.addRow(row: ["外币","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["股票","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["基金","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["债权","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["投资保单","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["投资资产","  ", "  ", "投资负债", "投资净值","  ","  ","  "])
        gridViewController.addRow(row: ["自用电脑","  ", "  ", "  ", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["自用手机","  ", "  ", "自用贷款", "  ","  ","  ","  "])
        gridViewController.addRow(row: ["自用资产","  ", "  ", "自用负债", "自用净值","  ","  ","  "])
        view.addSubview(gridViewController.view)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRect(x:0, y:50, width:view.frame.width,height:view.frame.height-60)
        
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
