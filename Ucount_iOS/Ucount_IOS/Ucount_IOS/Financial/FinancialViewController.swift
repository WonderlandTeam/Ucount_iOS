//
//  FinancialViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/20.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class FinancialViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    var popularViewController: PopularViewController!
    var pushViewController: PushViewController!
    var knowledgeViewController: KnowledgeViewController!
    
    var X: CGFloat!
    var Y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "PopularViewController") as! PopularViewController
        pushViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "PushViewController") as! PushViewController
        knowledgeViewController = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "KnowledgeViewController") as! KnowledgeViewController
        
        self.view.addSubview(popularViewController.view)
        self.view.addSubview(segment)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentTapped(_ sender: AnyObject) {
        let array = self.view.subviews as NSArray
        let views = array.count
        
        (array.object(at: views-1) as AnyObject).removeFromSuperview()
        (array.object(at: views-2) as AnyObject).removeFromSuperview()
        
        switch sender.selectedSegmentIndex{
        case 0:
            self.view.addSubview(popularViewController.view)
            break
        case 1:
            self.view.addSubview(pushViewController.view)
            break
        case 2:
            self.view.addSubview(knowledgeViewController.view)
            break
        default:
            break
        }
        
        self.view.addSubview(segment)
    }
    
    
    
}



