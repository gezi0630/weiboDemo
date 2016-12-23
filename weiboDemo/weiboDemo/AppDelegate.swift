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
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        
        
        
        
        
        return true
    }

    

}

