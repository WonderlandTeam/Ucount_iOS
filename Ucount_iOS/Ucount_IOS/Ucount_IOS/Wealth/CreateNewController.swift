//
//  CreateNewController.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/8/22.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField


protocol SendMessageDelegate :class {
    func sendWord (message : [String])
}


class CreateNewController: UIViewController {
    
    @IBOutlet weak var typePicker: UIPickerView!  //账户类型
    

    @IBOutlet weak var name: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var money: SkyFloatingLabelTextFieldWithIcon!
    
    var countType : [String] = ["银行卡","信用卡","微信钱包"]
    
    var newInfo : [String] = [] //封装新建账户类型
    
    weak var sendDelegate : SendMessageDelegate?
    
    let usedColor = UIColor.init(red: 0x85/255, green: 0xC5/255, blue: 0xD6/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.placeholder = "请输入账户名称"
        name.iconFont = UIFont.init(name: "FontAwesome", size: 18)
        name.iconText = "\u{f007}"
        name.iconMarginBottom = -3
        
        money.placeholder = "请输入账户金额"
        money.iconFont = UIFont.init(name: "FontAwesome", size: 18)
        money.iconText = "\u{f0d6}"
        money.iconMarginBottom = -3
        
        name.title = "账户名称"
        money.title = "账户金额"
        
        name.selectedIconColor = usedColor
        money.selectedIconColor = usedColor
        name.selectedTitleColor = usedColor
        money.selectedTitleColor = usedColor
        name.selectedLineColor = usedColor
        money.selectedLineColor = usedColor
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func  sendNameToWealth (sender : AnyObject) {
        
        
        let confirmAction = UIAlertAction(title: "确定",style : .default,handler: nil)
        if(name.text == "")
        {

            
            SweetAlert().showAlert("请确认", subTitle: "您没有填写账户名称喔", style: AlertStyle.warning)
        }
        
        else if(money.text == "")
        {
            SweetAlert().showAlert("请确认", subTitle: "您没有填写账户金额喔", style: AlertStyle.warning)        }
        else
        {
            SweetAlert().showAlert("保存成功！", subTitle:"成功创建新账户",style: AlertStyle.success)
            print("选择类型"+"\(typePicker.selectedRow(inComponent: 0))")
            if sendDelegate != nil{
                 newInfo.append(name.text!)
                 newInfo.append(money.text!)
                 newInfo.append(countType[typePicker.selectedRow(inComponent: 0)])
                 self.sendDelegate?.sendWord( message: newInfo )
            }
            
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            

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

