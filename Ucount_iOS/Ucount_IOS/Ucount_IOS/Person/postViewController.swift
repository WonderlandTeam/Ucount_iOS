//
//  postViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class postViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var theTitle: String!
    var postsToShow: [Post]!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = theTitle
        self.table.tableFooterView = UIView()
        
        //假定所要展示的帖子列表
        postsToShow = [Post(id: "456", title: "title1", author: "author1", date: "2017-12-30 12:00", content: "content1", like: 67),
                       Post(id: "457", title: "title2", author: "author2", date: "2016-12-4 22:00", content: "content2", like: 7),
                       Post(id: "458", title: "title3", author: "author3", date: "2013-11-20 6:00", content: "content3", like: 6)]
        
        switch theTitle {
        case "我的帖子":
            print("get我的帖子")
            break
        case "我的收藏":
            print("get我的收藏")
            break
        case "我的赞":
            print("get我的赞")
            break
        case "我的评论":
            print("get我的评论")
            break
        default:
            break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return postsToShow.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = postsToShow[indexPath.row].title
        (cell.viewWithTag(101) as! UILabel).text = postsToShow[indexPath.row].author
        (cell.viewWithTag(102) as! UILabel).text = postsToShow[indexPath.row].date
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.table.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "articleViewController") as! articleViewController
        
        //返回的是否点赞和收藏和收藏的数据
        vc.callBack = ({(change: postRead)->Void  in
            print(change.id)
            print(change.isLike)
            print(change.isCollect)
        })
        //传递过去的有关帖子的数据
        vc.post = postsToShow[indexPath.row]
        
        self.present(vc,animated: true){
            
        }
    }
    

    
    
    
}
