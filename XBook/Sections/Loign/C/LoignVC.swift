//
//  LoignVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class LoignVC: UIViewController {

    @IBOutlet weak var evtxfUserName: UITextField!
    @IBOutlet weak var evtxfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //登录
    @IBAction func efOnClickLogin(sender: AnyObject, forEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true) {
        }
    }
}
