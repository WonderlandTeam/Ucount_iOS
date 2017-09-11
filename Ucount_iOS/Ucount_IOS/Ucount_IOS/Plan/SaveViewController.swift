//
//  SaveViewController.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/9/3.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

var plans = [Plan(name: "年底去欧洲旅游", date: "2017-12-31", money: 20000, hasMoney: 3040, completeDate: "2017-12-22", moneyEveryday: 300),Plan(name: "这个月买手环", date: "2017-09-31", money: 500, hasMoney: 230, completeDate: "2017-08-05", moneyEveryday: 34),Plan(name: "11月初余钱3000", date: "2017-11-01", money: 3000, hasMoney: 456, completeDate: "2017-10-22", moneyEveryday: 20)]

class SaveViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.table.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "addPlanView") as! addPlanViewController
        
        vc.callBack = ({(modify: Plan)->Void  in
            if(modify.name != ""){
                plans.append(modify)
                self.table.reloadData()
            }
        })
        
        self.present(vc,animated: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name( "currentPageChanged_plan"), object: 1)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return plans.count
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.table.dequeueReusableCell(withIdentifier: "firstCell")!
        
        //cell里要显示的东西
        (cell.viewWithTag(100) as! UILabel).text = plans[indexPath.row].name
        
        cell.accessoryType = .disclosureIndicator
        // cell.editingAccessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "planDetailView") as! planDetailViewController
        vc.plan = plans[indexPath.row]
        
        vc.callback = ({(modify: Plan)->Void  in
            plans[indexPath.row] = modify
            self.table.reloadData()
        })
        
        self.present(vc,animated: true)

        
    }

    

}
