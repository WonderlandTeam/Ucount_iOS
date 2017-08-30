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
    
    var post: Post!
    var callBack: postCallBack!
    
    var isLike: Bool = false
    var isCollect: Bool  = false
    var comment: String = ""
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.callBack(postRead(id: post.id, isLike: isLike, isCollect: isCollect, comment: self.comment))
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
        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "talkViewController") as! talkViewController
        
        //返回的是评论的内容
        vc.callBack = ({(words: String)->Void  in
            self.comment = words
        })
        
        self.present(vc,animated: true){
            
        }
    }
    
    override func viewDidLoad() {
        self.theTitle.text = post.title
        self.author.text = post.author
        self.date.text = post.date
        self.content.text = post.content
        self.likeLabel.text = String(post.like)
        
        super.viewDidLoad()
        
        self.content.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}









