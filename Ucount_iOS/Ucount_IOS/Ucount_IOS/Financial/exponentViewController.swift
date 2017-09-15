//
//  exponentViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/14.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class exponentViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var items = ["生存指数","恋爱指数","肥胖指数","交友指数"]
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.table.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = items[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.tableView.deselectRow(at: indexPath, animated: true)
//        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "articleViewController") as! articleViewController
//        
//        //返回的是否点赞和收藏和收藏的数据
//        vc.callBack = ({(change: postRead)->Void  in
//            print(change.id)
//            print(change.isLike)
//            print(change.isCollect)
//        })
//        //传递过去的有关帖子的数据
//        vc.post = posts[indexPath.row]
//        
//        self.present(vc,animated: true){
//            
//        }
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
