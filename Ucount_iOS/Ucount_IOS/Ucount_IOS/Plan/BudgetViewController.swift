//
//  BudgetViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit


var budgets = [Budget(type: "饮食", money: 823.9, month: 9, year: 2017, left: 300),Budget(type: "书", money: 234, month: 9, year: 2017, left: 100),Budget(type: "交通", money: 45, month: 1, year: 2018, left: 45),
Budget(type: "饮食", money: 1000, month: 1, year: 2018, left: 600)]

var budgetsToShow = [Budget]()
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
        var dateString:String = dateFormatter.string(from: NSDate() as Date)
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
        
        self.picker.selectRow(0,inComponent:0,animated:true)
        self.picker.selectRow(8,inComponent:1,animated:true)
        
        for i in 0...budgets.count-1{
            if(budgets[i].year==Int(currentYear)&&budgets[i].month==Int(currentMonth)){
                budgetsToShow.append(budgets[i])
            }
        }

    
    }
    
    func dateChanged(_ sender: UIPickerView){
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged_plan"), object: 0)
        

        
        
        self.table.reloadData()
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
        
        if (component == 0){
            return String(years[row])
        }else{
            return String(months[row])
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return budgetsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        let image = cell.viewWithTag(100) as! UIImageView
        image.image = (UIImage(named: budgetsToShow[indexPath.row].type))
        (cell.viewWithTag(101) as! UILabel).text = budgetsToShow[indexPath.row].type
        (cell.viewWithTag(102) as! UILabel).text = String(budgetsToShow[indexPath.row].left)
        (cell.viewWithTag(103) as! UILabel).text = String(budgetsToShow[indexPath.row].money)
    
        cell.accessoryType = .disclosureIndicator
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "modifyBudgetView") as! modifyBudgetViewController
        vc.budget = budgetsToShow[indexPath.row]
        
        vc.callBack = ({(bud: Budget)->Void  in
            if(bud.type == ""){
                budgetsToShow.remove(at: indexPath.row)
                self.table.reloadData()
            }else{
                budgetsToShow[indexPath.row] = bud
                self.table.reloadData()
            }
        })
        
        self.present(vc,animated: true)
    }
    
    
    
    
    
    
    @IBAction func close(segue: UIStoryboardSegue){
        table.reloadData()
    }

    
}




































