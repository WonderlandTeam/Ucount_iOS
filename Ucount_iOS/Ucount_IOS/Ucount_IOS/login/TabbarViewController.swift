//
//  TabbarViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/19.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class TabbarViewController: UIViewController {
    
    var swipeLeft :UISwipeGestureRecognizer!;   // 左滑手势
    var swipeRight :UISwipeGestureRecognizer!;  // 右滑手势
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var aboveView: UIView!
    
    var flag = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //下面这段代码将滑动事件注册到我们的表层的view中，就是只有对表层的view滑动，才会触发滑动效果
        swipeLeft = UISwipeGestureRecognizer(target:self, action: #selector(TabbarViewController.swipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.bottomView.addGestureRecognizer(swipeLeft)
        swipeRight = UISwipeGestureRecognizer(target:self, action: #selector(TabbarViewController.swipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.bottomView.addGestureRecognizer(swipeRight)
        
        self.aboveView.center.x = -self.aboveView.bounds.width/2
    }
    

    //注册的划定监听罪行的方法，
    func swipe(_ recognizer:UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.left{
            UIView.animate(withDuration:0.5, animations: {
                if(self.flag%2 != 0){ //归位
                    self.aboveView.center.x = self.aboveView.center.x - self.aboveView.bounds.width
                    self.flag+=1;
                }
            })
            
        }else if recognizer.direction == UISwipeGestureRecognizerDirection.right{
            UIView.animate(withDuration:0.5, animations: {
                if(self.flag%2 == 0){  //向右滑出
                    self.aboveView.center.x = self.aboveView.center.x + self.aboveView.bounds.width;
                    self.flag+=1;
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
    
    }
    
    
    // 定义全局变量flag，每次通过flag，表层view来判断执行向左还是向右移动的动画，然后执行flag＋1，这样保证我们点击左上角按钮的时候，奇数情况下就是关闭抽屉，偶数情况则为打开抽屉
    
    @IBAction func openDraw(_ sender:AnyObject) {
        UIView.animate(withDuration:0.5, animations: {
            if(self.flag%2 == 0){
                self.aboveView.center.x = self.aboveView.center.x+self.view.bounds.width/1.5;
            }else{
                self.aboveView.center.x = self.view.bounds.width/2;
            }
            self.flag+=1;
        })
    }
    
    
}




















