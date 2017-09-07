//
//  balanceViewCell.swift
//  Ucount_IOS
//
//  Created by 李一鹏 on 2017/9/6.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import UIKit

class balanceViewCell: UICollectionViewCell {
    
    //内容标签
    var label:UILabel!
    
    //标签左边距
    var paddingLeft:CGFloat = 5
    
    //箭头图标
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        //添加内容标签
        self.label = UILabel(frame: .zero)
        self.label.textAlignment = .center
        self.addSubview(self.label)
        
        //添加箭头图标
        self.imageView = UIImageView(frame: .zero)
        self.addSubview(self.imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: paddingLeft, y: 0,
                             width: frame.width - paddingLeft * 2,
                             height: frame.height)
        
        let imageWidth: CGFloat = 14
        let imageHeight: CGFloat = 14
        imageView.frame = CGRect(x:frame.width - imageWidth,
                                 y:frame.height/2 - imageHeight/2,
                                 width:imageWidth, height:imageHeight)    }
    
    
}
