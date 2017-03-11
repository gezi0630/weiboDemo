//
//  AppDelegate.swift
//  weiboDemo
//
//  Created by MAC on 2016/12/22.
//  Copyright © 2016年 GuoDongge. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        // 设置导航条和工具条的外观
        // 因为外观一旦设置全局有效, 所以应该在程序一进来就设置
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().tintColor = UIColor.orange
        
        
        //1.创建window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        //2.创建根控制器
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        
        return true
    }

    

}

