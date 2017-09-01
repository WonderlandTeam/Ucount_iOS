//
//  knowledgeDetailViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class knowledgeDetailViewController: UIViewController {
    
    var num:Int!

    @IBOutlet var gesture: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pdfPath = Bundle.main.path(forResource: String(num), ofType: "pdf")
        let pdfUrl = URL(fileURLWithPath: pdfPath!)
        let scrollView = PDFScrollView(frame: view.frame)
        scrollView.PDF = CGPDFDocument.init(pdfUrl as CFURL)
        scrollView.initialize()
        view.addSubview(scrollView)
        
        self.gesture.addTarget(self, action: #selector(knowledgeDetailViewController.back(_:)))
        self.view.addGestureRecognizer(self.gesture)

    }

    
    func back(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == UISwipeGestureRecognizerDirection.right) {
            self.dismiss(animated: true, completion: {
                
            })
        }
        
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
