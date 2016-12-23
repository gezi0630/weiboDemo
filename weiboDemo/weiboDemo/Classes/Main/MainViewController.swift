//
//  MainViewController.swift
//  weiboDemo
//
//  Created by MAC on 2016/12/23.
//  Copyright © 2016年 GuoDongge. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.orange
        
/*    //1、创建首页
        let home = HomeViewController()
        
        //1.1设置首页tabbar对应的数据
        home.tabBarItem.image = UIImage(named: "tabbar_home")
        home.tabBarItem.selectedImage = UIImage(named: "tabbar_home_highlighted")
        home.title = "首页"
        
        //2、给首页包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(home)
        
        //3、将导航控制器添加到当前控制器上
        addChildViewController(nav)
*/
        
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "tabbar_home")
        
       addChildViewController(childController: MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        
        addChildViewController(childController: DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(childController: ProfileViewController(), title: "我", imageName: "tabbar_profile")
    }

    /**
     初始化自控制器
     childController 需要初始化的自控制器
     title      子控制器的标题
     imageName  子控制器的图片
     */
    func addChildViewController(childController: UIViewController,title:String,imageName:String) {
        
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        childController.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
        
        
    }
    
    
    
}
