//
//  commentViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class commentViewController: UIViewController {

    var comments = [Comment(postId: "", userId: "", date: "", text: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
