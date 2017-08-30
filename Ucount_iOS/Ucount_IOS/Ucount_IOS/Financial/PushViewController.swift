//
//  PushViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class PushViewController: UIViewController,UITextFieldDelegate ,UITextViewDelegate{
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postContent: UITextView!
    
    
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postTitle.text = ""
        self.postTitle.layer.borderWidth = 1
        self.postTitle.layer.borderColor = UIColor.gray.cgColor
        self.postTitle.layer.cornerRadius = 8

        self.postContent.text = ""
        self.postContent.layer.borderWidth = 1
        self.postContent.layer.borderColor = UIColor.gray.cgColor
        self.postContent.layer.cornerRadius = 10
        self.postTitle.delegate = self
        self.postContent.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textViewDidBeginEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.4, animations: {
            self.contentHeight.constant = 300
        })
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.8, animations: {
            self.contentHeight.constant = 528
            
        })
    }

    @IBAction func pushTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "发布成功!",
                                                message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    
    override  func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点到view的别的地方，焦点从textfield转移,反焦点
        postTitle.resignFirstResponder()
        postContent.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        postTitle.resignFirstResponder()
        return true
    }
    
    
    
}
