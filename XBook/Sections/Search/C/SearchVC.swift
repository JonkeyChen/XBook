//
//  SearchVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDataSource {

    private var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        efConfigure()
        
        efRequestForList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func efConfigure(){
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight), style: .Plain)
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }
    
    private func efRequestForList (){
        let url:NSURL = NSURL(string: "http://platform-api.release.1yd.me/api/credits/products/7")!
        
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "POST"
        
        var response:NSURLResponse?
        
        do {
            let received:NSData? = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            let dataString = NSString(data: received!, encoding: NSUTF8StringEncoding)
            print("resoponseData ==> " + String(dataString))
        } catch let error as NSError {
            print("错误Code: " + String(error.code))
            print("错误描述:  " + String(error.description))
        }
        
        
        
        
        
    }
}


extension SearchVC {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell?.textLabel?.text = "标题"+String(indexPath.row)
        
        return cell!
    }
}