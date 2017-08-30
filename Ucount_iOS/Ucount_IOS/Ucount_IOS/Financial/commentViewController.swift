//
//  commentViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class commentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var comments:[Comment] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.estimatedRowHeight = 80
        self.table.rowHeight = UITableViewAutomaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return comments.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = comments[indexPath.row].userId
        (cell.viewWithTag(101) as! UILabel).text = comments[indexPath.row].date
        (cell.viewWithTag(102) as! UILabel).text = comments[indexPath.row].text
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }

}
