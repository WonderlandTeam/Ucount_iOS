//
//  BudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit


var budgets = [Budget(type: "饮食", money: 123.9, date: "2017-12-31"),Budget(type: "书", money: 234, date: "2018-2-1"),Budget(type: "交通", money: 45, date: "2018-2-9")]
class BudgetViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var picker: UIPickerView!
   
    @IBOutlet weak var table: UITableView!
    var currentYear:String!
    var currentMonth:String!
    
    var years = [String]()
    var months = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dateFormatter:DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var dateString:String = dateFormatter.string(from: NSDate() as Date);
        var dates = dateString.components(separatedBy: "/")
        currentYear  = (dates[0])
        currentMonth = (dates[1])
    
        for i in 0 ... 10{
            years.append(String(Int(currentYear)!+i))
        }
        
        for i in 1...12{
            months.append(String( i))
        }
        
        
        picker.delegate = self
        picker.dataSource = self

        self.table.tableFooterView = UIView()
        self.view.bringSubview(toFront: self.table)
        // Do any additional setup after loading the view.
    }
    
    func dateChanged(_ sender: UIPickerView){
        
    }
    
//    @IBAction func addTapped(_ sender: UIButton) {
//        let vc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "addBudgetView") as! addBudgetViewController
//        
////        //返回的是否点赞和收藏和收藏的数据
////        vc.callBack = ({(budget): Budget)->Void  in
////           
////        })
//        
//        self.present(vc,animated: true){
//            
//        }
//
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged_plan"), object: 0)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return  2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (component == 0){
            return years.count
        }else{
            return months.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        //let row1 = pickerView.selectedRow(inComponent: 0)
        if (component == 0){
            return String(years[row])
        }else{
            return String(months[row])
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return budgets.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        let image = cell.viewWithTag(100) as! UIImageView
        image.image = (UIImage(named: budgets[indexPath.row].type))
        (cell.viewWithTag(101) as! UILabel).text = budgets[indexPath.row].type
        (cell.viewWithTag(102) as! UILabel).text = String(budgets[indexPath.row].money)
        (cell.viewWithTag(103) as! UILabel).text = String(budgets[indexPath.row].date)
        
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    
    //删除预算项
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCellEditingStyle.delete){
            budgets.remove(at: indexPath.row)
            self.table.reloadData()
            self.table.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        table.reloadData()
    }

    
}




































