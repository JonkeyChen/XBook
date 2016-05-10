//
//  NavigationBarFactory.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class NavigationBarFactory: NSObject {
    
    //设置"关闭"&&"发布"
    static func efSetNavigationBar(targer:UIViewController,titleLeft:String="关闭",titleRight:String="确定") {
        targer.view.backgroundColor = UIColor.whiteColor()
        
        let  etbtnLeft = UIButton(frame: CGRectMake(10,20,40,20))
        etbtnLeft.setTitle(titleLeft, forState: .Normal)
        etbtnLeft.titleLabel?.font = UIFont(name: fontName, size: 14)
        etbtnLeft.setTitleColor(MainColor, forState: .Normal)
        etbtnLeft.tag = 1234;
        etbtnLeft.addTarget(targer, action: Selector("efOnClickLeft"), forControlEvents: .TouchUpInside)
        targer.view.addSubview(etbtnLeft)

        let etbtnRight = UIButton(frame: CGRectMake(ScreenWidth-10-40,20,40,20))
        etbtnRight.setTitle(titleRight, forState: .Normal)
        etbtnRight.titleLabel?.font = UIFont(name: fontName, size: 14)
        etbtnRight.setTitleColor(MainColor, forState: .Normal)
        etbtnRight.tag = 5678
        etbtnRight.addTarget(targer, action: Selector("efOnClickRight"), forControlEvents: .TouchUpInside)
        targer.view.addSubview(etbtnRight)
    }
}
