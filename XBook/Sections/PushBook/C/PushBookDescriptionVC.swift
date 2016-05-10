//
//  PushBookDescriptionVC.swift
//  XBook
//
//  Created by Tianjian on 16/5/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias pushBookDescription = (descriptionContent:String) -> Void

class PushBookDescriptionVC: UIViewController {

    var descriptionBlock:pushBookTitleBlock?
    
    private var evtxvWriteDescription:JVFloatLabeledTextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "确定")
        
        self.efSetTextView()
    }
    
    private func efSetTextView(){
        self.evtxvWriteDescription = JVFloatLabeledTextView(frame: CGRectMake(10, 40, ScreenWidth-20, ScreenHeight-40-20))
        self.evtxvWriteDescription?.placeholder = "你可以在这里填写详细的评价，吐槽，介绍～～"
        self.evtxvWriteDescription?.font = UIFont(name: fontName, size: 14)
        self.evtxvWriteDescription?.floatingLabelXPadding = 10
        self.evtxvWriteDescription?.floatingLabelYPadding = 5
        self.evtxvWriteDescription?.placeholderYPadding   = 5
        self.evtxvWriteDescription?.floatingLabelFont = UIFont(name: fontName, size: 14)
        self.view.addSubview(self.evtxvWriteDescription!)
    }

    @objc private func efOnClickLeft(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func efOnClickRight(){
        self.descriptionBlock!(title: (self.evtxvWriteDescription?.text)!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
