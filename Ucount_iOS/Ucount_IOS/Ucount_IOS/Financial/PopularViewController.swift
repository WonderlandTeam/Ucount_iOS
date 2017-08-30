//
//  PopularViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var posts = [Post(id: "456", title: "title1", author: "author1", date: "2017-12-30 12:00", content: "content1", like: 67),
                 Post(id: "457", title: "title2", author: "author2", date: "2016-12-4 22:00", content: "content2", like: 7),
                 Post(id: "458", title: "title3", author: "author3", date: "2013-11-20 6:00", content: "content3", like: 6)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        super.viewDidLoad()
        
        self.view.bringSubview(toFront: tableView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return posts.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = posts[indexPath.row].title
        (cell.viewWithTag(101) as! UILabel).text = posts[indexPath.row].author
        (cell.viewWithTag(102) as! UILabel).text = posts[indexPath.row].date
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "articleViewController") as! articleViewController
        
        //返回的是否点赞和收藏和收藏的数据
        vc.callBack = ({(change: postRead)->Void  in
            print(change.id)
            print(change.isLike)
            print(change.isCollect)
        })
        //传递过去的有关帖子的数据
        vc.post = posts[indexPath.row]
        
        self.present(vc,animated: true){
            
        }
    }
    
}










