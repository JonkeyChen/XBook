//
//  RegisterVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var evtxfUserName: UITextField!
    @IBOutlet weak var evtxfPassword: UITextField!
    @IBOutlet weak var evtxfEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func efOnClickRegister(sender: AnyObject, forEvent event: UIEvent) {
    }
    
    @IBAction func efOnClickExit(sender: AnyObject, forEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true) {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
