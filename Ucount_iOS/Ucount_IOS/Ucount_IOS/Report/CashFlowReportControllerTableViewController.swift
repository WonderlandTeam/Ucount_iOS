//
//  CashFlowReportControllerTableViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/6.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class CashFlowReportControllerTableViewController: UITableViewController {

    var timeLine = ["2017-09-05","2017-09-05","2017-08-31","2017-08-30","2017-08-30","2017-08-29"]
    
    var type = ["支出","收入","收入","支出","支出","收入"]
    
    var money = [269.0,350.0,580.0,188.0,399.0,600]
    
    var moneyType = ["书","工资收入","理财收入","彩妆","社交","一般收入"]
    
    
    
    @IBOutlet weak var CashFlow: UITableView!
    
    let loadingView = DGElasticPullToRefreshLoadingViewCircle()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CashFlow.separatorStyle = UITableViewCellSeparatorStyle.none
        
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        CashFlow.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            // Add your logic here
            // Do not forget to call dg_stopLoading() at the end
            self?.CashFlow.dg_stopLoading()
            }, loadingView: loadingView)
        CashFlow.dg_setPullToRefreshFillColor(UIColor(red: 0xC6/255.0, green: 0xE4/255.0, blue: 0xEC/255.0, alpha: 1.0))
        CashFlow.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    deinit {
        CashFlow.dg_removePullToRefresh()
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
        return timeLine.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(type[indexPath.row] == "收入")
        {
            
            let incomeCell = tableView.dequeueReusableCell(withIdentifier: "incomeFlow", for: indexPath)
            
            let incomeSplitLine = incomeCell.viewWithTag(21)!
            
            incomeSplitLine.backgroundColor = UIColor.gray
            
            let incomeIcon = incomeCell.viewWithTag(20) as! UIImageView
            let incomeType = incomeCell.viewWithTag(22) as! UILabel
            let incomeMoney = incomeCell.viewWithTag(23) as! UILabel
            let incomeTime = incomeCell.viewWithTag(24) as! UILabel
            
            incomeType.text = moneyType[indexPath.row]
            incomeType.textColor = UIColor.gray
            incomeIcon.image = UIImage(named: moneyType[indexPath.row])
            incomeMoney.text = "\(money[indexPath.row])"
           // incomeMoney.textColor = UIColor.gray
            incomeTime.text = timeLine[indexPath.row]
            incomeTime.textColor = UIColor.gray
            
            
            return incomeCell
        }
        
        else
        {
            
            let expendCell = tableView.dequeueReusableCell(withIdentifier: "expendFlow", for: indexPath)
            
            let expendSplitLine = expendCell.viewWithTag(11)!
            
            expendSplitLine.backgroundColor = UIColor.gray
            
        
            
            
            let expendIcon = expendCell.viewWithTag(10) as! UIImageView
            
            let expendType = expendCell.viewWithTag(12) as! UILabel
            let expendMoney = expendCell.viewWithTag(13) as! UILabel
            let expendTime = expendCell.viewWithTag(14) as! UILabel



            expendType.text = moneyType[indexPath.row]
            expendType.textColor = UIColor.gray
            expendIcon.image = UIImage(named: moneyType[indexPath.row])
            expendMoney.text = "\(money[indexPath.row])"
           // expendMoney.textColor = UIColor.gray
            expendTime.text = timeLine[indexPath.row]
            expendTime.textColor = UIColor.gray
            
            
            return expendCell
            
        }


    
        // Configure the cell...

        
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
