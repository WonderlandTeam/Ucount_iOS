//
//  adviceViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/16.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class adviceViewController: UIViewController {
    var cosumeAdvance : String = "消费建议\n\n\n您的消费水平：较高\n\n您的消费消费特征：总支出较多，消费较为均衡\n\n此类大学生消费趋于多样化且较为均衡，文教类支出最多。建议控制好其他不必要的消费，并且培养一定的理财意识。"

    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.isEditable = false
        self.textView.text = self.cosumeAdvance
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged_plan"), object: 2)
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
