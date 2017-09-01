//
//  KnowledgeViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/26.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    var knowledges = [Knowledge(title: "基础理财知识普及", content: content1),
                      Knowledge(title: "大学生理财真人秀：不做“穷学生”，只需这四步", content: content2),
                      Knowledge(title: "理财和不理财，人生会有多大差别？", content: content3),
                      Knowledge(title: "理财全靠机器？理财经理怎么办？", content: content4),
                      Knowledge(title: "银行理财要蔫了，但还有更安全的理财方式！", content: content5),
                      Knowledge(title: "政府工作报告对股市影响解读汇总：2017全年看呈U型", content: content6),
                      Knowledge(title: "普及知识部分", content: content7),
                      Knowledge(title: "拓展知识部分", content: content8)]


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
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = knowledges[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.table.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Financial", bundle: nil).instantiateViewController(withIdentifier: "knowledgeDetailViewController") as! knowledgeDetailViewController
        
        //传递过去的有关帖子的数据
        vc.num = indexPath.row+1
        
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
