//
//  PushBookTitleVC.swift
//  XBook
//
//  Created by Tianjian on 16/5/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias pushBookTitleBlock  = (title:String) ->Void

class PushBookTitleVC: UIViewController {

    var  pushTitleBlock:pushBookTitleBlock?
    
    private var evtxfBookTitle:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "确定")
        
        self.efSetWriteTextField()
    }
    
    @objc private func efOnClickLeft(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func efOnClickRight(){
        self.pushTitleBlock!(title: (self.evtxfBookTitle?.text!)!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func efSetWriteTextField(){
        self.evtxfBookTitle = UITextField(frame: CGRectMake(20,50,ScreenWidth-40,30))
        self.evtxfBookTitle?.placeholder = "书评标题"
        self.evtxfBookTitle?.borderStyle = .RoundedRect
        self.evtxfBookTitle?.font = UIFont(name: fontName, size: 14)
        self.view.addSubview(self.evtxfBookTitle!)
    }
    

}
