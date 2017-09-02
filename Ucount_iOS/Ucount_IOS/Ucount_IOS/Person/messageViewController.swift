//
//  messageViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/31.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class messageViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var messages = [Message]()
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
        messages = [Message(userId: "userid1", title: "本月食堂预算超支", date: "2017-9-1 8:00", content: "     您本月食堂预算已超支，请注意。"),
                    Message(userId: "userid2", title: "购买台灯任务完成", date: "2013-9-1 15:00", content: "        您要购买台灯的任务已完成啦~~~恭喜啦~~~")]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return messages.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = messages[indexPath.row].title
            cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.table.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Person", bundle: nil).instantiateViewController(withIdentifier: "messageDetailViewController") as! messageDetailViewController
    
        vc.message = messages[indexPath.row]
        self.present(vc,animated: true){
            
        }
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
