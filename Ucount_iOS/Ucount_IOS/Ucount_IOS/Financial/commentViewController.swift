//
//  commentViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class commentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var post: Post!      //该帖子的所有信息
    var comments:[Comment] = []  //对于该帖子所有的评论
    var comment: String! //跳转到talk后新加的评论
    
    @IBOutlet weak var table: UITableView!

    @IBAction func addCommentTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "talkViewController") as! talkViewController
        
        //返回的是评论的内容
        vc.callBack = ({(words: String)->Void  in
            self.comment = words
            //与逻辑层对接存储评论,不用返回给article
            print(self.post.id)
            print(self.post.author)
            print(self.comment)
        })
        
        self.present(vc,animated: true){
            
        }

    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true) {

        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
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
        
        return cell
    }

}
