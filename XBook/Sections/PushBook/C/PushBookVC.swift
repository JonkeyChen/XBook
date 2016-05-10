//
//  PushBookVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushBookVC: UIViewController,BookTitleViewDelegate,UITableViewDelegate,UITableViewDataSource ,PhotoPickerViewDelegate,VPImageCropperDelegate{

    var bookTitle:String?
    
    var bookDescription:String?
    
    var bookTypeContent:String?
    
    private var evBookTitle:BookTitleView?
    
    private var evtblTableView:UITableView?
    
    private var titleArray:Array<String> = []
    
    private var evScore:LDXScore?
    
    private var evtxfDescription:UITextView?
    
    private var showStars = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "发布")
        
        //1.初始化书名，作者，封面
        self.evBookTitle = BookTitleView(frame: CGRectMake(0,40,ScreenWidth,160))
        self.evBookTitle?.delegate = self
        self.view.addSubview(self.evBookTitle!)
        
        //2,初始化UITableView
        self.evtblTableView = UITableView(frame: CGRectMake(0, 200, ScreenWidth, ScreenHeight-200), style: .Grouped)
        self.evtblTableView?.delegate = self
        self.evtblTableView?.dataSource = self
        self.evtblTableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.evtblTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.evtblTableView!)
        
        //3.初始化数据
        self.titleArray = ["标题","评分","分类","书评"]
        
        //4.评分
        self.evScore = LDXScore(frame: CGRectMake(100,10,100,22))
        self.evScore?.isSelect     = true
        self.evScore?.normalImg    = UIImage(named: "btn_star_evaluation_normal")
        self.evScore?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.evScore?.max_star     = 5
        self.evScore?.show_star    = 5
        
        //5.书评描述
        self.evtxfDescription = UITextView(frame: CGRectMake(15, 4, ScreenWidth-30, 80))
        self.evtxfDescription?.font = UIFont(name: fontName, size: 14)
        self.evtxfDescription?.editable = false
    }
    //OnClickAction......................
    @objc private func efOnClickLeft() {//关闭
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func efOnClickRight() {//发布
        print("发布")
    }
    
    //Delegate..........................
    func bookTitleView(bookTitleView: BookTitleView, ChoiceBookCover cover: UIButton) {
        let  photoPickerVC = PhotoPickerVC()
        photoPickerVC.delegate = self
        self.presentViewController(photoPickerVC, animated: true, completion: nil)
    }
    
    func photoPickerViewReturnWithImage(image: UIImage) {
        let CroVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, ScreenWidth, ScreenWidth*1.273), limitScaleRatio: 3)
        CroVC.delegate = self
        self.presentViewController(CroVC, animated: true) { () -> Void in
            
        }
    }
    
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.evBookTitle?.bookCoverImage = editedImage
        cropperViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension PushBookVC {
    //tableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontName, size: 14)
        cell.detailTextLabel?.font = UIFont(name: fontName, size: 13)
        
        if indexPath.row != 1 {
            cell.accessoryType = .DisclosureIndicator
        }
        
        var  row = indexPath.row
        
        if self.showStars && row > 1 {
            row -= 1
        }
        
        if row > 3 {
            cell.accessoryType = .None
        }
        
        switch row {
        case 0:
            cell.detailTextLabel?.text = self.bookTitle
            break
        case 1:
            
            break
        case 2:
            cell.detailTextLabel?.text = self.bookTypeContent
            break
        case 3:
            
            break
        case 4:
            cell.addSubview(self.evtxfDescription!)
            break
        default:
            break
        }
        
        if self.showStars && indexPath.row == 2 {
            cell.addSubview(self.evScore!)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var row = indexPath.row
        
        if self.showStars && row > 1 {
            row -= 1
        }
        
        switch row {
        case 0:
            let  pushBookTitleVC = PushBookTitleVC()
            pushBookTitleVC.pushTitleBlock = ({(title:String) ->Void in
                self.bookTitle = title
                self.evtblTableView?.reloadData()
            })
            self.presentViewController(pushBookTitleVC, animated: true, completion: nil)
            break
        case 1:
            
            let insertOrDeleteIndex = [NSIndexPath(forItem: 2, inSection: 0)]
            
            self.evtblTableView?.beginUpdates()
            
            if self.showStars {//删除
                self.titleArray.removeAtIndex(2)
                self.evtblTableView?.deleteRowsAtIndexPaths(insertOrDeleteIndex, withRowAnimation: .Right)
                self.showStars = false
            } else {//插入
                self.titleArray.insert("", atIndex: 2)
                self.evtblTableView?.insertRowsAtIndexPaths(insertOrDeleteIndex, withRowAnimation: .Left)
                self.showStars = true
            }
            
            self.evtblTableView?.endUpdates()
            
            break
        case 2:
            let  pushBookKindsVC = PushBookKindsVC()
            pushBookKindsVC.pushBookKindeCallBack = ({(kindeContent:String) -> Void in
                self.bookTypeContent = kindeContent
                self.evtblTableView?.reloadData()
            })
            self.presentViewController(pushBookKindsVC, animated: true, completion: nil)
            break
        case 3:
            let  pushBookDescriptionVC = PushBookDescriptionVC()
            pushBookDescriptionVC.descriptionBlock = ({(descriptionContent:String) -> Void in
                if self.titleArray.last == "" {
                    self.titleArray.removeLast()
                }
                
                if descriptionContent != "" {
                    self.evtxfDescription?.text = descriptionContent
                    self.titleArray.append("")
                }
                
                self.evtblTableView?.reloadData()
            })
            self.presentViewController(pushBookDescriptionVC, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.showStars && indexPath.row > 4 {
            return 88
        } else if !self.showStars && indexPath.row > 3 {
            return 88
        } else {
            return 44
        }
    }
}
