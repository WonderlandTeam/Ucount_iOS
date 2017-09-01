//
//  knowledgeDetailViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class knowledgeDetailViewController: UIViewController {

    var knowledge: Knowledge!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true) { 
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.content.layer.borderWidth = 1
        self.content.layer.borderColor = UIColor.gray.cgColor
        self.content.layer.cornerRadius = 10
        self.titleLabel.text = knowledge.title
        self.content.text = knowledge.content
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
