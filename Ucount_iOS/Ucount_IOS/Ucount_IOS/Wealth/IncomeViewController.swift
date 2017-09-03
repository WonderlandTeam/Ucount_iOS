//
//  IncomeViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

private let reuseIdentifier = "incomeCell"

class IncomeViewController: UICollectionViewController {
    
    var sorts = [
    ["name":"工资收入","pic":"工资收入"],
    ["name":"奖金收入","pic":"奖金收入"],
    ["name":"理财收入","pic":"理财收入"],
    ["name":"一般收入","pic":"一般收入"]
    
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        //已经在界面定义并注册，不需要代码再次注册
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        self.collectionView?.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: NSNotification.Name( "currentCashPageChanged"), object: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sorts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: sorts[indexPath.item]["pic"]!)
        
        (cell.contentView.viewWithTag(2) as! UILabel).text = sorts[indexPath.item]["name"]!
        (cell.contentView.viewWithTag(2) as! UILabel).adjustsFontSizeToFitWidth = true
        
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
//     Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        var cell = collectionView.cellForItem(at: indexPath)
        
        //var indexArray = [IndexPath]()
        
        var itemCount = sorts.count
        
        for index in 0...(itemCount-1){
            let tempIndex = IndexPath(row : index,section: 0)
            //indexArray.append(tempIndex)
            cell = collectionView.cellForItem(at: tempIndex)
            cell?.backgroundColor = UIColor.white
        }
        
            cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.brown
        
            NotificationCenter.default.post(name: NSNotification.Name( "printIcon"), object: sorts[indexPath.item]["name"]!)
        //print(sorts[indexPath.item]["name"]!)
    }
    

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
