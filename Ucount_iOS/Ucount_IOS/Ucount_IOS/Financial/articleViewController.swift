//
//  articleViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/29.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class articleViewController: UIViewController {
    
    typealias postCallBack = (_ change: postRead)->Void
    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var talkButton: UIButton!
    
    
    //这篇帖子所有的信息
    var post: Post!

    var callBack: postCallBack!
    
    var isLike: Bool = false
    var isCollect: Bool  = false
    var comment: String = ""
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.callBack(postRead(id: post.id, isLike: isLike, isCollect: isCollect))
        self.dismiss(animated: true )
    }
    
    @IBAction func collectTapped(_ sender: UIButton) {
        sender.isEnabled = false
        if(sender.imageView?.image == UIImage(named:"收藏")){
            sender.setImage(UIImage(named:"已收藏"), for: UIControlState.normal)
            self.isCollect = true
        }else if (sender.imageView?.image == UIImage(named:"已收藏")){
            sender.setImage(UIImage(named:"收藏"), for: UIControlState.normal)
            self.isCollect = false
        }
        
        sender.isEnabled  = true
    }

    
    
    @IBAction func likeTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let origin = Int(self.likeLabel.text!)
        if(sender.imageView?.image == UIImage(named:"赞")){
            sender.setImage(UIImage(named:"已赞"), for: UIControlState.normal)
            self.likeLabel.text = String(origin!+1)
            self.isLike = true
        }else if (sender.imageView?.image == UIImage(named:"已赞")){
            sender.setImage(UIImage(named:"赞"), for: UIControlState.normal)
            self.likeLabel.text = String(origin!-1)
            self.isLike = false
        }
        
        sender.isEnabled  = true
    }
    
    @IBAction func talkTapped(_ sender: Any) {

        //这里根据post.id来找到所有的评论，并传给commentViewController
        var comments = [Comment(postId: post.id, currentId: "firstcomment", userId: "userid1", date: "2017-3-18 22:00", text: "文章写得很好。这个人之前写过很多有用的干活，希望大家都踊跃一些去找他啊"),
                       Comment(postId: post.id, currentId: "secondComment", userId: "userid2", date: "2013-12-1 22:20", text: "给你加个鸡腿！！"),
                       Comment(postId: post.id, currentId: "thirdComment", userId: "userid3", date: "2012-11-28 12:00", text: "哈哈哈")]

        //comments.removeAll()
        if(comments.count == 0){//没有评论
            let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "talkViewController") as! talkViewController
            
            vc.callBack = ({(words: String)->Void  in
                //与逻辑层对接存储评论,不用返回给article
                print(self.post.id)
                print(self.post.author)
                print(words)
            })

            
            self.present(vc,animated: true){
                
            }
        }else{//有评论
            let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "commentViewController") as! commentViewController
            vc.comments = comments
            vc.post = self.post
            self.present(vc,animated: true){
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        self.theTitle.text = post.title
        self.author.text = post.author
        self.date.text = post.date
        self.content.text = post.content
        self.likeLabel.text = String(post.like)
        
        super.viewDidLoad()
        
        self.content.layer.borderWidth = 1
        self.content.layer.borderColor = UIColor.gray.cgColor
        self.content.layer.cornerRadius = 10

        self.content.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}









