//
//  TradeRecordViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/2.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class TradeRecordViewController: UITableViewController {

    @IBOutlet var traderecord: UITableView!
    var records : [[Int:String]] = [[Int:String]]()
    
    let loadingView = DGElasticPullToRefreshLoadingViewCircle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        traderecord.separatorStyle = UITableViewCellSeparatorStyle.none
        
        loadingView.tintColor = UIColor(red: 0xC6/255.0, green: 0xE4/255.0, blue: 0xEC/255.0, alpha: 1.0)
        traderecord.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            // Add your logic here
            // Do not forget to call dg_stopLoading() at the end
            self?.traderecord.dg_stopLoading()
            }, loadingView: loadingView)
        traderecord.dg_setPullToRefreshFillColor(UIColor(red: 0x5E/255.0, green: 0xC9/255.0, blue: 0xAF/255.0, alpha: 0.8))
        traderecord.dg_setPullToRefreshBackgroundColor(traderecord.backgroundColor!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    deinit {
        traderecord.dg_removePullToRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        traderecord.reloadData()
        
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
        var num = records.count
        
        return num
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transRecordCell", for: indexPath)

        var cellIcon = cell.viewWithTag(23) as! UIImageView
        var cellType = cell.viewWithTag(20) as! UILabel
        var cellComment = cell.viewWithTag(21) as! UILabel
        var cellTime = cell.viewWithTag(22) as! UILabel
        var cellMoney = cell.viewWithTag(24) as! UILabel
        
        cellIcon.image = UIImage(named:records[indexPath.row][1]!)
        cellType.text = records[indexPath.row][1]
        cellType.adjustsFontSizeToFitWidth = true
        cellMoney.adjustsFontSizeToFitWidth = true
        if(records[indexPath.row][0] == "收入")
        {
            cellMoney.text = "+" + records[indexPath.row][2]!
            cellMoney.textColor = UIColor.green
        }
        else
        {
            cellMoney.text = "-"+records[indexPath.row][2]!
            cellMoney.textColor = UIColor.red
        }
        
        cellComment.text = records[indexPath.row][3]
        cellTime.text = records[indexPath.row][4]
        //cellTime.lineBreakMode = NSLineBreakMode.byWordWrapping
        cellTime.numberOfLines = 3
        cellTime.adjustsFontSizeToFitWidth = true
        
        

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
