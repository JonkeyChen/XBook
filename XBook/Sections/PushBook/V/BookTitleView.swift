//
//  BookTitleView.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

@objc protocol BookTitleViewDelegate {
    optional func bookTitleView(bookTitleView:BookTitleView,ChoiceBookCover cover:UIButton)
}

class BookTitleView: UIView {

    var evbtnBookCover:UIButton?
    
    var evtxfBookName:JVFloatLabeledTextField?
    
    var evtxfBookEditor:JVFloatLabeledTextField?
    
    var delegate:BookTitleViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.evbtnBookCover = UIButton(frame: CGRectMake(10,8,110,141))
        self.evbtnBookCover?.setImage(UIImage(named: "Cover"), forState: .Normal)
        self.addSubview(self.evbtnBookCover!)
        self.evbtnBookCover?.addTarget(self, action: Selector("efOnClickChoiceCover"), forControlEvents: .TouchUpInside)
        
        self.evtxfBookName = JVFloatLabeledTextField(frame: CGRectMake(128,7+40,ScreenWidth-128-15,30))
        self.evtxfBookName?.placeholder = "书名"
        self.evtxfBookName!.floatingLabelFont = UIFont(name: fontName, size: 14)
        self.evtxfBookName?.font = UIFont(name: fontName, size: 14)
        self.addSubview(self.evtxfBookName!)
        
        self.evtxfBookEditor = JVFloatLabeledTextField(frame: CGRectMake(128,7+40+70,ScreenWidth-128-15,30))
        self.evtxfBookEditor?.placeholder = "作者"
        self.evtxfBookEditor?.floatingLabelFont = UIFont(name: fontName, size: 14)
        self.evtxfBookEditor?.font = UIFont(name: fontName, size: 14)
        self.addSubview(self.evtxfBookEditor!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func efOnClickChoiceCover(){
        print("选择封面")
        self.delegate?.bookTitleView!(self, ChoiceBookCover: self.evbtnBookCover!)
    }
}
