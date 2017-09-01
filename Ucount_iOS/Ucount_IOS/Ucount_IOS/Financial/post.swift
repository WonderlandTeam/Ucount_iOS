//
//  File.swift
//  Ucount_IOS
//
//  Created by 黄飘 on 2017/8/29.
//  Copyright © 2017年 李一鹏. All rights reserved.
//

import Foundation

struct Post {
    var id: String
    var title: String
    var author: String
    var date: String
    var content: String
    var like: Int

}
struct postRead {
    var id: String
    var isLike: Bool
    var isCollect: Bool
}

struct myPost{
    var id: String
    var title: String
    var author:String
    var date:String
}

struct Comment{
    var postId: String
    var currentId: String
    var userId: String
    var date: String
    var text: String
}


let content1 = ""
let content2 = ""
let content3 = ""
let content4 = "content4"
let content5 = "content5"
let content6 = "content6"
let content7 = "content7"
let content8 = "content8"
