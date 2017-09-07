//
//  balanceViewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/6.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit



class balanceViewController: UICollectionViewController {

    //表头数据
    var cols: [String]! = []
    //行数据
    var rows: [[Any]]! = []
    //单元格内容居左时的左侧内边距
    private var cellPaddingLeft:CGFloat = 5
    
    init(){
        print("没毛病")
        let layout = UICollectionGridViewLayout()
        super.init(collectionViewLayout: layout)
        
        layout.viewController = self
        collectionView!.backgroundColor = UIColor.white
        collectionView!.register(balanceViewCell.self,
                                 forCellWithReuseIdentifier: "cell")
        collectionView!.delegate = self
        collectionView!.dataSource = self

        collectionView!.isDirectionalLockEnabled = true
        //collectionView!.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
        collectionView!.bounces = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("balanceViewController.init(coder:) has not been implemented")
    }
    
    //设置列头数据
    func setColumns(columns: [String]) {
        cols = columns
    }
    
    //添加行数据
    func addRow(row: [Any]) {
        rows.append(row)
        collectionView!.collectionViewLayout.invalidateLayout()
        collectionView!.reloadData()
    }
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if cols.isEmpty {
            return 0
        }
        //总行数是：记录数＋1个表头
        return rows.count + 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cols.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! balanceViewCell
        
        
        //设置列头单元格，内容单元格的数据
        if indexPath.section == 0 {
            cell.label.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightBold)
            cell.label.text = cols[indexPath.row]
            cell.label.adjustsFontSizeToFitWidth = true
            cell.label.textColor = UIColor.white
        } else {
            cell.label.font = UIFont.systemFont(ofSize: 11)
            
            cell.label.text = "\(rows[indexPath.section-1][indexPath.row])"
            cell.label.adjustsFontSizeToFitWidth = true
            
            cell.label.textColor = UIColor.black
        }
        
        //表头单元格背景色
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor(red: 0x91/255, green: 0xDA/255, blue: 0x51/255, alpha: 1)
            //排序列列头显示升序降序图标
            //            if indexPath.row == selectedColIdx {
            //                let iconType = asc ? FAType.FALongArrowUp : FAType.FALongArrowDown
            //                cell.imageView.setFAIconWithName(icon: iconType, textColor: UIColor.white)
            //            }else{
            //                cell.imageView.image = nil
            //            }
        }
            //内容单元格背景色
        else {
            //排序列的单元格背景会变色
            //            if indexPath.row == selectedColIdx {
            //                //排序列的单元格背景会变色
            //                cell.backgroundColor = UIColor(red: 0xCC/255, green: 0xF8/255, blue: 0xFF/255,
            //                                               alpha: 1)
            //            }
            //数据区域每行单元格背景色交替显示
            
            if(("\(rows[indexPath.section-1][0])" == "流动资产")||("\(rows[indexPath.section-1][0])" == "投资资产")||("\(rows[indexPath.section-1][0])" == "自用资产"))
            {
                cell.backgroundColor = UIColor(red: 0x91/255, green: 0xDA/255, blue: 0x51/255, alpha: 1)
                cell.label.textColor = UIColor.white
            }
                
            else if indexPath.section % 2 == 0
            {
                cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1)
            }
            else
            {
                cell.backgroundColor = UIColor.white
            }
        }
        
        return cell
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
