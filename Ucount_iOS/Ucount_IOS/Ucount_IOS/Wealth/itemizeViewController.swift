//
//  itemizeViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/25.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class itemizeViewController: UIViewController {
    
    var countRecord :[[Int:String]] = [[Int:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //返回事件
    @IBAction func back(_ sender:Any)
    {
        self.dismiss(animated: true, completion: nil)
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
