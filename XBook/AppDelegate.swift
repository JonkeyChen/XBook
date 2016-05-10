//
//  AppDelegate.swift
//  XBook
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //initControllers
        let  rankVC   = UINavigationController(rootViewController: RankVC())
        let  searchVC = UINavigationController(rootViewController: SearchVC())
        let  pushVC   = UINavigationController(rootViewController: PushVC())
        let  circleVC = UINavigationController(rootViewController: CircleVC())
        let  moreVC   = UINavigationController(rootViewController: MoreVC())
        
        //setting TabBarItems
        rankVC.tabBarItem   = UITabBarItem(title: "排行榜", image: UIImage(named: "IconTabBioNomarl"),    selectedImage: UIImage(named: "IconTabBioPress"))
        searchVC.tabBarItem = UITabBarItem(title: "发现",  image: UIImage(named: "IconTabTimeNomarl"),    selectedImage: UIImage(named: "IconTabTimePress"))
        pushVC.tabBarItem   = UITabBarItem(title: "",      image: UIImage(named: "IconTabUserOneNomarl"), selectedImage: UIImage(named: "IconTabUserOnePress"))
        circleVC.tabBarItem = UITabBarItem(title: "圈子",  image: UIImage(named: "IconTabUserTwoNoarml"), selectedImage: UIImage(named: "IconTabUserTwoPress"))
        moreVC.tabBarItem   = UITabBarItem(title: "更多",  image: UIImage(named: "IconTabMoreNomarl"),    selectedImage: UIImage(named: "IconTabMorePress"))
        
        //initTabBarController
        let  tabBarController = UITabBarController()
        tabBarController.viewControllers = [rankVC, searchVC,pushVC,circleVC, moreVC]
        rankVC.tabBarController?.tabBar.tintColor = MainColor
        
        //initWindow Object
        self.window = UIWindow(frame: CGRectMake(0,0,ScreenWidth,ScreenHeight))
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController =  tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

