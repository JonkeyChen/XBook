//
//  PhotoPickerVC.swift
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

protocol PhotoPickerViewDelegate {
    func photoPickerViewReturnWithImage(image:UIImage)->Void
}

class PhotoPickerVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var alert:UIAlertController?
    
    var picker = UIImagePickerController!()
    
    var delegate:PhotoPickerViewDelegate?
    
    
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

        self.picker = UIImagePickerController()
        self.picker.allowsEditing = false
        self.picker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        if(self.alert == nil){
            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            self.alert?.addAction(UIAlertAction(title: "从相册选择", style: .Default, handler: { (action) -> Void in
                self.efOnClickTakePhoto()
            }))
            self.alert?.addAction(UIAlertAction(title: "相机", style: .Default, handler: { (action) -> Void in
                self.efOnClickTakeCarmera()
            }))
            self.alert?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.alert?.popoverPresentationController?.sourceView = self.view
            self.presentViewController(self.alert!, animated: true, completion: { () -> Void in
                
            })
        }
        
    }
    private func efOnClickTakePhoto(){
        self.picker.sourceType = .PhotoLibrary
        self.presentViewController(self.picker, animated: true) { () -> Void in
            
        }
    }
    
    private func efOnClickTakeCarmera(){
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){//有照相机
            self.picker.sourceType = .Camera
            self.presentViewController(self.picker, animated: true, completion: { () -> Void in
                
            })
        }        
    }
    
    /**
     UIImagePickerControllerDelegate
     */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
              self.delegate?.photoPickerViewReturnWithImage(image)
            })
        }
    }
    
    
}
