//
//  PushBookKindsVC.swift
//  XBook
//
//  Created by Tianjian on 16/5/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias pushBookKindsBlock = (kindeContent:String) -> Void

class PushBookKindsVC: UIViewController ,IGLDropDownMenuDelegate {

    var  pushBookKindeCallBack:pushBookKindsBlock?
    
    private var contentString:String?
    
    private var dropMenue1:IGLDropDownMenu?
    private var dropMenue2:IGLDropDownMenu?
    private var segment1:AKSegmentedControl?
    private var segment2:AKSegmentedControl?
    
    private var literatureArray1:Array<NSDictionary> = []
    private var literatureArray2:Array<NSDictionary> = []
    
    private var humanitiesArray1:Array<NSDictionary> = []
    private var humanitiesArray2:Array<NSDictionary> = []
    
    private var livelihoodArray1:Array<NSDictionary> = []
    private var livelihoodArray2:Array<NSDictionary> = []
    
    private var economiesArray1:Array<NSDictionary> = []
    private var economiesArray2:Array<NSDictionary> = []
    
    private var technologyArray1:Array<NSDictionary> = []
    private var technologyArray2:Array<NSDictionary> = []
    
    private var NetworkArray1:Array<NSDictionary> = []
    private var NetworkArray2:Array<NSDictionary> = []
    
    private var titleColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NavigationBarFactory.efSetNavigationBar(self, titleLeft: "关闭", titleRight: "确定")
        
        self.efSetKindsCategory()
    }
    
    @objc private func efOnClickLeft(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func efOnClickRight(){
        
        self.pushBookKindeCallBack!(kindeContent: self.contentString!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func efSetKindsCategory(){
        self.titleColor = RGB(38, g: 82, b: 67)
        
        //关闭 && 确定
        let etbtnLeft  = self.view.viewWithTag(1234) as! UIButton
        let etbtnRight = self.view.viewWithTag(5678) as! UIButton
        etbtnLeft.setTitleColor(self.titleColor, forState: .Normal)
        etbtnRight.setTitleColor(self.titleColor, forState: .Normal)
        
        //title
        let etlblTitle = UILabel(frame: CGRectMake((ScreenWidth-300)*0.5,20,300,20))
        etlblTitle.font = UIFont(name: fontName, size: 17)
        etlblTitle.text = "选择分类"
        etlblTitle.shadowColor = UIColor.whiteColor()
        etlblTitle.shadowOffset = CGSizeMake(0, 1)
        etlblTitle.textColor = self.titleColor
        etlblTitle.textAlignment = .Center
        self.view.addSubview(etlblTitle)

        //SegmentCtrol
        let buttonArray1 = [
            ["image":"ledger","title":"文学","font":fontName],
            ["image":"drama masks","title":"人文社科","font":fontName],
            ["image":"aperture","title":"生活","font":fontName],
        ]
        let buttonArray2 = [
            ["image":"atom","title":"经管","font":fontName],
            ["image":"alien","title":"科技","font":fontName],
            ["image":"fire element","title":"网络流行","font":fontName],
        ]
        
        self.literatureArray1 = [
            ["title":"小说"],
            ["title":"漫画"],
            ["title":"青春文学"],
            ["title":"随笔"],
            ["title":"现当代诗"],
            ["title":"戏剧"],
        ];
        self.literatureArray2 = [
            ["title":"传记"],
            ["title":"古诗词"],
            ["title":"外国诗歌"],
            ["title":"艺术"],
            ["title":"摄影"],
        ];
        self.humanitiesArray1 = [
            ["title":"历史"],
            ["title":"文化"],
            ["title":"古籍"],
            ["title":"心理学"],
            ["title":"哲学/宗教"],
            ["title":"政治/军事"],
        ];
        self.humanitiesArray2 = [
            ["title":"社会科学"],
            ["title":"法律"],
        ];
        self.livelihoodArray1 = [
            ["title":"休闲/爱好"],
            ["title":"孕产/胎教"],
            ["title":"烹饪/美食"],
            ["title":"时尚/美妆"],
            ["title":"旅游/地图"],
            ["title":"家庭/家居"],
        ];
        self.livelihoodArray2 = [
            ["title":"亲子/家教"],
            ["title":"两性关系"],
            ["title":"育儿/早教"],
            ["title":"保健/养生"],
            ["title":"体育/运动"],
            ["title":"手工/DIY"],
        ];
        self.economiesArray1  = [
            ["title":"管理"],
            ["title":"投资"],
            ["title":"理财"],
            ["title":"经济"],
        ];
        self.economiesArray2  = [
            ["title":"没有更多了"],
        ];
        self.technologyArray1 =  [
            ["title":"科普读物"],
            ["title":"建筑"],
            ["title":"医学"],
            ["title":"计算机/网络"],
        ];
        self.technologyArray2 = [
            ["title":"农业/林业"],
            ["title":"自然科学"],
            ["title":"工业技术"],
        ];
        self.NetworkArray1 =    [
            ["title":"玄幻/奇幻"],
            ["title":"武侠/仙侠"],
            ["title":"都市/职业"],
            ["title":"历史/军事"],
        ];
        self.NetworkArray2 =    [
            ["title":"游戏/竞技"],
            ["title":"科幻/灵异"],
            ["title":"言情"],
        ];
        
        self.segment1 = AKSegmentedControl(frame: CGRectMake(10,60,ScreenWidth-20,37))
        self.segment1?.initButtonWithTitleandImage(buttonArray1)
        self.view.addSubview(self.segment1!)
        self.segment2 = AKSegmentedControl(frame: CGRectMake(10,110,ScreenWidth-20,37))
        self.segment2?.initButtonWithTitleandImage(buttonArray2)
        self.view.addSubview(self.segment2!)
        
        self.segment1?.addTarget(self, action: #selector(efOnClickSegemnt(_:)), forControlEvents: .ValueChanged)
        self.segment1?.addTarget(self, action: #selector(efOnClickSegemnt(_:)), forControlEvents: .ValueChanged)
    }
    
    @objc private func efOnClickSegemnt(segement:AKSegmentedControl){
        var index = segement.selectedIndexes.firstIndex
        
        
        if segement == self.segment1{
            self.segment1?.setSelectedIndex(3)
        }else{
            self.segment2?.setSelectedIndex(3)
            index += 3
        }
        
        if self.dropMenue1 != nil {
            self.dropMenue1?.resetParams()
        }
        if self.dropMenue2 != nil {
            self.dropMenue2?.resetParams()
        }
        
        switch (index){
        case 0:
            self.efCreateDropDownMenu(self.literatureArray1, array2: self.literatureArray2)
            break
        case 1:
            self.efCreateDropDownMenu(self.humanitiesArray1, array2: self.humanitiesArray2)
            break
        case 2:
            self.efCreateDropDownMenu(self.livelihoodArray1, array2: self.livelihoodArray2)
            break
        case 3:
            self.efCreateDropDownMenu(self.economiesArray1, array2: self.economiesArray2)
            break
        case 4:
            self.efCreateDropDownMenu(self.technologyArray1, array2: self.technologyArray2)
            break
        case 5:
            self.efCreateDropDownMenu(self.NetworkArray1, array2: self.NetworkArray2)
            break
        default:
            break
            
        }
    }
    
    private func efCreateDropDownMenu(array1:Array<NSDictionary>,array2:Array<NSDictionary>){
        let dropDownItem1 = NSMutableArray()
        
        for (index,obj) in array1.enumerate() {
            let dict = array1[index]
            let item = IGLDropDownItem()
            item.text = dict["title"] as?String
            dropDownItem1.addObject(item)
        }
        
        
        let dropDownItem2 = NSMutableArray()
        for (index,obj) in array2.enumerate() {
            let dict  = array2[index]
            let item  = IGLDropDownItem()
            item.text = obj["title"] as?String
            dropDownItem2.addObject(item)
        }
        
    
        
        
        self.dropMenue1?.removeFromSuperview()
        self.dropMenue1 = IGLDropDownMenu()
        self.dropMenue1?.menuText = "点我，展开详细列表"
        self.dropMenue1?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        self.dropMenue1?.menuButton.textLabel.textColor = RGB(38, g: 82, b: 67)
        self.dropMenue1?.paddingLeft = 15
        self.dropMenue1?.delegate = self
        self.dropMenue1?.type = .Stack
        self.dropMenue1?.itemAnimationDelay = 0.1
        self.dropMenue1?.gutterY = 5
        self.dropMenue1?.dropDownItems = dropDownItem1 as [AnyObject]
        self.dropMenue1?.frame = CGRectMake(20, 150, ScreenWidth/2-30, (ScreenHeight-200)/7)
        self.view.addSubview(self.dropMenue1!)
        self.dropMenue1?.reloadView()
        
        
        self.dropMenue2?.removeFromSuperview()
        self.dropMenue2 = IGLDropDownMenu()
        self.dropMenue2?.menuText = "点我，展开详细列表"
        self.dropMenue2?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        self.dropMenue2?.menuButton.textLabel.textColor = RGB(38, g: 82, b: 67)
        self.dropMenue2?.paddingLeft = 15
        self.dropMenue2?.delegate = self
        self.dropMenue2?.type = .Stack
        self.dropMenue2?.itemAnimationDelay = 0.1
        self.dropMenue2?.gutterY = 5
        self.dropMenue2?.dropDownItems = dropDownItem2 as [AnyObject]
        self.dropMenue2?.frame = CGRectMake(ScreenWidth/2+10, 150, ScreenWidth/2-30, (ScreenHeight-200)/7)
        self.view.addSubview(self.dropMenue2!)
        self.dropMenue2?.reloadView()
        
        let item1 = self.dropMenue1?.dropDownItems[0] as? IGLDropDownItem
        let item2 = self.dropMenue2?.dropDownItems[0] as? IGLDropDownItem
        //self.type = (item1?.text)!
        //self.detailType = (item2?.text)!
        
        self.contentString = (item1?.text)! + String("-") + (item2?.text)!
    }

    /**
     IGLDropDownMenuDelegate
     */
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        if dropDownMenu == self.dropMenue1 {
            let item = self.dropMenue1?.dropDownItems[index] as? IGLDropDownItem
            self.contentString = (item?.text)! + String("-") + (self.dropMenue2?.menuButton.text)!
        }else{
            let item = self.dropMenue2?.dropDownItems[index] as? IGLDropDownItem
            self.contentString = (item?.text)! + String("-") + (self.dropMenue1?.menuButton.text)!
        }
    }
}
