//
//  PhotoPickerVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PhotoPickerVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    
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

}
