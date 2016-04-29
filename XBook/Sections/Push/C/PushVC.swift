//
//  PushVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.efSetNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func efSetNavigationBar(){
        let navigationView = UIView(frame: CGRectMake(0,-20,ScreenWidth,65))
        navigationView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(navigationView)
        
        let etbtnPushBook = UIButton(frame: CGRectMake(20,20,ScreenWidth,45))
        etbtnPushBook.setImage(UIImage(named: "IconPuls"), forState: .Normal)
        etbtnPushBook.setTitle("      新建书评", forState: .Normal)
        etbtnPushBook.titleLabel?.font = UIFont(name: fontName, size: 14)
        etbtnPushBook.setTitleColor(UIColor.blackColor(), forState: .Normal)
        etbtnPushBook.contentHorizontalAlignment = .Left
        etbtnPushBook.addTarget(self, action: Selector("efOnClcikPushNewBook"), forControlEvents: .TouchUpInside)
        navigationView.addSubview(etbtnPushBook)
    }
    
    func efOnClcikPushNewBook(){
        let pushBookVC = PushBookVC()
        self.presentViewController(pushBookVC, animated:true, completion: nil)

    }
}
