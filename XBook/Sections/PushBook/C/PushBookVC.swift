//
//  PushBookVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushBookVC: UIViewController,BookTitleViewDelegate,UITableViewDelegate,UITableViewDataSource {

    var evBookTitle:BookTitleView?
    
    var evtblTableView:UITableView?
    
    var titleArray:Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "发布")
        
        //1.初始化书名，作者，封面
        self.evBookTitle = BookTitleView(frame: CGRectMake(0,40,ScreenWidth,160))
        self.evBookTitle?.delegate = self
        self.view.addSubview(self.evBookTitle!)
        
        //2,初始化UITableView
        self.evtblTableView = UITableView(frame: CGRectMake(0, 200, ScreenWidth, ScreenWidth-200), style: .Plain)
        self.evtblTableView?.delegate = self
        self.evtblTableView?.dataSource = self
        self.evtblTableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.evtblTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.evtblTableView!)
        
        //3.初始化数据
        self.titleArray = ["标题","评分","分类","书评"]
    }
    //OnClickAction......................
    func efOnClickLeft() {//关闭
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func efOnClickRight() {//发布
        print("发布")
    }
    
    //Delegate..........................
    func bookTitleView(bookTitleView: BookTitleView, ChoiceBookCover cover: UIButton) {
        
        let etAlertView = AlertView()
        etAlertView.titleArray = ["相册","取消"]
        etAlertView.selectedAtIndex = ({(index:Int) in
            print(index)
        })
        self.presentViewController(etAlertView, animated: true, completion:nil)
        
    }
    //tableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = self.titleArray[indexPath.row]
        cell?.textLabel?.font = UIFont(name: fontName, size: 14)
        return cell!
    }
    
}
