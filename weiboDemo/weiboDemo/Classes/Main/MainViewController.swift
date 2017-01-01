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

        //将图片和文字颜色设为橘色
        tabBar.tintColor = UIColor.orange
        
        /* 有时候需要动态改变控制器，所以就要把控制器用字符串形式添加上去*/
        
        //1、获取json文件的路径
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        //2、通过文件路径创建NSData
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do{
                // 有可能发生异常的代码放到这里
                // 3.序列化json数据 --> Array
                // try : 发生异常会跳到catch中继续执行
                // try! : 发生异常程序直接崩溃
                let dictArr = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                //                print(dictArr)
                // 4.遍历数组, 动态创建控制器和设置数据
                // 在Swift中, 如果需要遍历一个数组, 必须明确数据的类型
                for dict in dictArr as! [[String: String]]
                {
                    // 报错的原因是因为addChildViewController参数必须有值, 但是字典的返回值是可选类型
                    addChildViewController(childControllerName: dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
                
            } catch  {
                
                
                print(error)
                
                        addChildViewController(childControllerName: "HomeViewController", title: "首页", imageName: "tabbar_home")
                
                        addChildViewController(childControllerName: "MessageViewController", title: "消息", imageName: "tabbar_message_center")
                
                        addChildViewController(childControllerName: "DiscoverViewController", title: "发现", imageName: "tabbar_discover")
                        addChildViewController(childControllerName: "ProfileViewController", title: "我", imageName: "tabbar_profile")

                
                
            }
            
            
            
            
        }
        
 
    
    }
    
    
   
    /**
     初始化子控制器
     childController 需要初始化的自控制器
     title      子控制器的标题
     imageName  子控制器的图片
     */
   private func addChildViewController(childControllerName: String,title:String,imageName:String) {
        
        //_1.动态获取命名空间（获取项目名称）
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"]as! String
        
        //_2.将字符串转化成类
      let cls:AnyClass? =                           NSClassFromString(ns + "." + childControllerName)
        //_3.将AnyClass转换为指定类型
        let vcCls = cls as! UIViewController.Type
        //_4.通过类创建对象
        let vc = vcCls.init()
        
       // 1、设置控制器tabbar对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
    
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        vc.title = title
        
        //2、给控制器包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        //3、将导航控制器添加到当前控制器上
        addChildViewController(nav)
        
        
    }
    
    
    
}
