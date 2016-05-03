//
//  PushBookVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushBookVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "发布")
    }
    override func didReceiveMemoryWarning() { 
        super.didReceiveMemoryWarning()
    }
    
    func efOnClickLeft() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func efOnClickRight() {
        print("发布")
    }
    
    
}
