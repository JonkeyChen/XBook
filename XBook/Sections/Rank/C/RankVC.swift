//
//  RankVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class RankVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.efSetLogin()
        //self.efCheckOutUserIsLogin()
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let loading = CSHProgressHUD()
        loading.show()
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            loading.hide()
        }
    }
    
    func efSetLogin() -> Void {
        let etbtnLogin = UIButton(frame: CGRectMake(20,100,ScreenWidth-40,30))
        etbtnLogin.setTitle("登录", forState: .Normal)
        etbtnLogin.setTitleColor(UIColor.redColor(), forState: .Normal)
        etbtnLogin.addTarget(self, action: Selector("efCheckOutUserIsLogin"), forControlEvents: .TouchUpInside)
        self.view.addSubview(etbtnLogin)
    }
    
    func efCheckOutUserIsLogin() -> Void {
        let story = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = story.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(loginVC, animated: true, completion: { () -> Void in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
