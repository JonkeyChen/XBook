//
//  AlertView.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias AlertBlock = (index:Int)->Void

class AlertView: UIViewController {
    
    var titleArray:Array<String> = []
    
    var selectedAtIndex:AlertBlock?
        
    init(){
        super.init(nibName:nil,bundle:nil)
        //背景透明设置
        self.modalPresentationStyle = .OverFullScreen
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.efSetAlertView()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func efSetAlertView(){
        let titleCount:Int = self.titleArray.count
        
        for (index,name) in self.titleArray.enumerate() {
            let  line = UIView(frame: CGRectMake(0,ScreenHeight - CGFloat(40*(titleCount-index)),ScreenWidth,1))
            line.backgroundColor = LineColor
            self.view.addSubview(line)
            
            let  etbtnAlert = UIButton(frame: CGRectMake(0,ScreenHeight - CGFloat(40*(titleCount-index))+1,ScreenWidth,39))
            etbtnAlert.setTitle(name, forState: .Normal)
            etbtnAlert.titleLabel?.font = UIFont(name: fontName, size: 15)
            etbtnAlert.setTitleColor(MainColor, forState: .Normal)
            self.view.addSubview(etbtnAlert)
            etbtnAlert.tag = index
            etbtnAlert.addTarget(self, action: #selector(efOnClickAlertAtIndex(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
    @objc private func efOnClickAlertAtIndex(sender:UIButton){
        self.selectedAtIndex!(index: sender.tag)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
