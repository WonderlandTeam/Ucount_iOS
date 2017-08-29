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
    
    var like: Int!
    var post: Post!
    var callBack: postCallBack!
    
    @IBAction func backTapped(_ sender: Any) {
        self.callBack(postRead(isLike: false, isCollect: true))
        
        self.dismiss(animated: true )
    }
    override func viewDidLoad() {
        self.theTitle.text = post.title
        self.author.text = post.author
        self.date.text = post.date
        self.content.text = post.content
        self.like = post.like
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
