//
//  PersonViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/24.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet var leftPan: UIPanGestureRecognizer!
    
    @IBOutlet weak var table: UITableView!
    
    
    var titles = ["修改密码","帖子","收藏","赞","评论","我的消息"]
    var images = ["修改密码","帖子","收藏","赞","评论","消息"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        
        self.view.addGestureRecognizer(leftPan)
        
        self.view.frame = CGRect(x:0,y:0,width:Common.screenWidth,height: Common.screenHeight)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellName = titles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="我的消息" || segue.identifier=="修改密码"){
        }else{
            let vc = segue.destination as! postViewController
            vc.theTitle = segue.identifier
        }
        
    }
    
}









