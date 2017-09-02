//
//  ExpendViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/1.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

private let reuseIdentifier = "expendCell"

class ExpendViewController: UICollectionViewController {
    
    var sorts = [
        ["name":"书","pic":"书"],
        ["name":"彩妆","pic":"彩妆"],
        ["name":"打印","pic":"打印"],
        ["name":"交通","pic":"交通"],
        ["name":"捐款","pic":"捐款"],
        ["name":"恋爱","pic":"恋爱"],
        ["name":"社交","pic":"社交"],
        ["name":"首饰","pic":"首饰"],
        ["name":"文具","pic":"文具"],
        ["name":"兴趣","pic":"兴趣"],
        ["name":"饮食","pic":"饮食"],
        ["name":"日用品","pic":"日用品"],
        ["name":"护肤品","pic":"护肤品"],
        ["name":"水电气","pic":"水电气"],
        ["name":"组织活动","pic":"组织活动"],
        ["name":"电子设备","pic":"电子设备"],
        ["name":"衣帽鞋服","pic":"衣帽鞋服"],
        ["name":"通讯和网费","pic":"通讯和网费"],
        ["name":"培训、考试","pic":"培训、考证费用"],
        
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        self.collectionView?.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged"), object: 1)
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

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        var cell = collectionView.cellForItem(at: indexPath)
        
        
        
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
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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
