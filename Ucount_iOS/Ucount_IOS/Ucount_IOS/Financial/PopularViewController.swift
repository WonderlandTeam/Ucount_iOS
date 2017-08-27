//
//  PopularViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var titleArray = ["this is a title","title1","title2"]
    var authorArray = ["theAuthor","myAuthor","hihihi"]
    var dateArray = ["2017-01-04 22:00","2013-12-03 23:00","2015-01-04 12:00"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 3
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "firstCell")!
        var title = cell.viewWithTag(100) as! UILabel
        title.text = titleArray[indexPath.row]
        var author = cell.viewWithTag(101) as! UILabel
        author.text = authorArray[indexPath.row]
        var date = cell.viewWithTag(102) as! UILabel
        date.text = dateArray[indexPath.row]
        
        return cell
    }
    
    
}
