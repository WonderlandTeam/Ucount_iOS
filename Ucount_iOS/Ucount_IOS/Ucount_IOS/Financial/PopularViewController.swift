//
//  PopularViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var posts = [Post(id: "0", title: "大学生理财真人秀：不做“穷学生”，只需这四步", author: "幸福的小草鸟 她理财", date: "2015-11-14 12:00", content: content1, like: 67),
                 Post(id: "1", title: "理财全靠机器？理财经理怎么办？", author: "理财经理第一频道", date: "2017-08-20 22:00", content: content1, like: 7),
                 Post(id: "2", title: "银行理财要蔫了，但还有更安全的理财方式！", author: "菜鸟 菜鸟理财", date: "2017-07-23 6:00", content: content1, like: 6)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 0)
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










