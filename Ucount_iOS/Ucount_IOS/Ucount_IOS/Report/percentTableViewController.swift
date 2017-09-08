//
//  percentTableViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/8.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class percentTableViewController: UITableViewController {
    
    var type: Int = 0 //0代表收入 1代表支出
    
    var countType :[String] = [String]() //收入／支出类型
    var countMoney :[Double] = [Double]()
    var totalMoney = 0.0
    
    var percentRecord :[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none

        self.view.frame = CGRect(x:0,y:1350, width: 414, height: 240)
        
        for i in 0...countMoney.count-1 {
            totalMoney = totalMoney + countMoney[i]
        }
        
        for i in 0...countMoney.count-1 {
            percentRecord.append(String(format: "%.1f", (countMoney[i] / totalMoney) * 100))
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countType.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath)
        //cell.frame = CGRect(x:10 , y:10 ,width:412,height: 120)
        let imageIcon = cell.viewWithTag(20) as! UIImageView
        let typeText = cell.viewWithTag(21) as! UILabel
        let percent = cell.viewWithTag(22) as! UILabel
        let money = cell.viewWithTag(23) as! UILabel
        
        //收入
        if(type == 0)
        {
            if(countType[indexPath.row] == "补助")
            {
                imageIcon.image = UIImage(named:"奖金收入")
            }
            else if(countType[indexPath.row] == "其他")
            {
                imageIcon.image = UIImage(named:"一般收入")
            }
            else
            {
                imageIcon.image = UIImage(named:countType[indexPath.row]+"收入")
            }
            typeText.text = countType[indexPath.row]+"收入"
            

        }
        //支出
        else
        {
            if(countType[indexPath.row] == "必需")
            {
                imageIcon.image = UIImage(named:"饮食")
            }
            else if(countType[indexPath.row] == "服饰")
            {
                imageIcon.image = UIImage(named:"衣帽鞋服")
            }
            else if(countType[indexPath.row] == "学习")
            {
                imageIcon.image = UIImage(named:"书")
            }
            else if(countType[indexPath.row] == "娱乐")
            {
                imageIcon.image = UIImage(named:"社交")
            }
            else if(countType[indexPath.row] == "理财")
            {
                imageIcon.image = UIImage(named:"组织活动")
            }
            else if(countType[indexPath.row] == "捐赠")
            {
                imageIcon.image = UIImage(named:"捐款")
            }
            else
            {
                imageIcon.image = UIImage(named:"电子设备")
            }
            
            typeText.text = countType[indexPath.row]+"支出"

            
        }
        
        percent.text = percentRecord[indexPath.row]+"%"
        
        money.text = "\(countMoney[indexPath.row])"
        

        typeText.adjustsFontSizeToFitWidth = true
        
        typeText.textColor = UIColor.gray
        percent.textColor = UIColor.gray
        money.textColor = UIColor.gray
        


        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
