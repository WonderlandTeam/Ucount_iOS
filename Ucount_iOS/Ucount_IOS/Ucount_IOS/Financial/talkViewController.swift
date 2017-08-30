//
//  talkViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/30.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class talkViewController: UIViewController {

    typealias talkCallBack = (_ words: String)->Void

    var callBack: talkCallBack!
    @IBOutlet weak var talkContent: UITextView!
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.callBack("")
        self.dismiss(animated: true)
    }
    
    
    @IBAction func pushTapped(_ sender: UIButton) {
        self.callBack(talkContent.text)
        self.dismiss(animated: true)
        
    }
    override func viewDidLoad() {
        self.talkContent.text = "请在这里发表评论。"
        self.talkContent.becomeFirstResponder()
        
        self.talkContent.layer.borderWidth = 1
        self.talkContent.layer.borderColor = UIColor.gray.cgColor
        self.talkContent.layer.cornerRadius = 10
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
