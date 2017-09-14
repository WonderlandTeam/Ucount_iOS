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


let content1 = "        今天高中同学的微信群在抱怨接下来的日子只能吃土了，有人说前天刚拿的1000的生活费，今天就只剩下270了。我好奇多问了句，你们生活费多少。结果发现，她们的生活费至少比我高了500左右。500元对我们来说是什么概念，在学校一天的花费大概是20-30,节约点的话，500元可能是 一个月在食堂的吃喝费用。虽然比她们的生活费少，但我从来没感到钱紧缺过，甚至我一个月能 攒下1500块钱，几乎可以和我的生活费比肩。那我是怎么做到的呢?\n\n    记账+开源+节流+理财，只要有这个意识，形成一种习惯，实施起来其实并不难，不信你们试试。"
let content2 = ""
let content3 = ""
let content4 = "content4"
let content5 = "content5"
let content6 = "content6"
let content7 = "content7"
let content8 = "content8"













