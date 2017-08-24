//
//  ViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/24.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var wealthViewController: WealthViewController!
    
    var personViewController: PersonViewController!
    var personPan: UIPanGestureRecognizer!
    var personNavigationController: PersonNavigationController!
    var distance: CGFloat = 0
    var leftDistance: CGFloat = 0
    
    var mainView: UIView!
    var homeNavigationController: UITabBarController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personNavigationController = UIStoryboard(name: "Person", bundle: nil).instantiateViewController(withIdentifier: "PersonNavigationController") as! PersonNavigationController
        
        personNavigationController.view.center = CGPoint(x: personNavigationController.view.center.x - Common.screenWidth , y:personNavigationController.view.center.y)
        
        
        self.view.addSubview(personNavigationController.view)
        
        personViewController = personNavigationController.viewControllers.first as! PersonViewController
        
        self.personPan = personViewController.leftPan
        self.personPan.addTarget(self, action: #selector(ViewController.leftPan(_:)))
        personViewController.view.addGestureRecognizer(personViewController.leftPan)
        
        
        mainView = UIView(frame: self.view.frame)
        homeNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNavigationController") as! UITabBarController
        
        wealthViewController = homeNavigationController.viewControllers?.first as! WealthViewController
        mainView.addSubview(wealthViewController.tabBarController!.view)
        mainView.addSubview(wealthViewController.view)
        self.view.addSubview(mainView)
        
        
        // 通过 StoryBoard 取出 HomeViewController 的 view，放在背景视图上面
        //homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //self.view.addSubview(homeViewController.view)
        
        
        // 绑定 UIPanGestureRecognizer
        wealthViewController.panGesture.addTarget(self, action: #selector(ViewController.pan(_:)))
        mainView.addGestureRecognizer(wealthViewController.panGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func leftPan(_ leftRecongnizer: UIPanGestureRecognizer) {
        let x = leftRecongnizer.translation(in: self.view).x
        let trueDistance = leftDistance + x
        
        // 如果 UIPanGestureRecognizer 结束，则激活自动停靠
        if leftRecongnizer.state == UIGestureRecognizerState.ended {
            
            if trueDistance < -Common.screenWidth * (1 / 3) {
                showHome()
            } else {
                showLeft()
            }
            return
        }
        
        // UIPanGestureRecognizer 未结束，执行平移
        if((leftRecongnizer.view?.center.x)! + trueDistance <= Common.screenWidth/2 && (leftRecongnizer.view?.center.x)! + trueDistance >= -Common.screenWidth/(1.5)){
            
            leftRecongnizer.view!.center = CGPoint(x: self.view.center.x + trueDistance, y: self.view.center.y)
            
            mainView.center = CGPoint(x: self.view.center.x + trueDistance + Common.screenWidth, y: self.view.center.y)
        }
        
        
        
    }
    
    // 响应 UIPanGestureRecognizer 事件
    func pan(_ recongnizer: UIPanGestureRecognizer) {
        
        let x = recongnizer.translation(in: self.view).x
        let trueDistance = distance + x // 实时距离
        
        
        // 如果 UIPanGestureRecognizer 结束，则激活自动停靠
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if trueDistance > Common.screenWidth * (1 / 3) {
                showLeft()
            } else {
                showHome()
            }
            return
        }
        
        // UIPanGestureRecognizer 未结束，执行平移
        if((recongnizer.view?.center.x)! + trueDistance >= Common.screenWidth/2 && (recongnizer.view?.center.x)! + trueDistance <= Common.screenWidth/(1.5)){
            
            recongnizer.view!.center = CGPoint(x: self.view.center.x + trueDistance, y: self.view.center.y)
            
            personNavigationController.view.center = CGPoint(x: self.view.center.x + trueDistance-Common.screenWidth, y: self.personNavigationController.view.center.y)
            personViewController.view.center = personNavigationController.view.center
            
        }
    }
    
    // 封装方法，便于后期调用
    
    // 展示左视图
    func showLeft() {
        distance = Common.screenWidth
        doTheAnimate()
    }
    // 展示主视图
    func showHome() {
        distance = 0
        doTheAnimate()
    }
    
    // 执行试图展示
    func doTheAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.mainView.center = CGPoint(x: Common.screenWidth/2 + self.distance, y: self.view.center.y)
            self.personNavigationController.view.center = CGPoint(x: Common.screenWidth/2 + self.distance-Common.screenWidth, y: self.personNavigationController.view.center.y)
            
            self.personViewController.view.center = CGPoint(x: Common.screenWidth/2 + self.distance-Common.screenWidth, y: self.personNavigationController.view.center.y)
            
        }, completion: nil)
    }
    
    
}
