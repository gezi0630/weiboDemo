//
//  BaseTableViewController.swift
//  weiboDemo
//
//  Created by MAC on 2017/1/5.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorViewDelegate {

    //定义一个变量保存用户当前是否登录
    var userLogin = true
    
    //定义属性保存未登录界面
    var visitorView :VisitorView?
    
    override func loadView() {
        
        //如果登录了，加载正常界面，否则加载访客界面
        userLogin ? super.loadView() : setupVisitorView()
        
    }
    
    
    //MARK: -内部控制方法
    
    /**
     创建未登录界面
 */
    private func setupVisitorView()
    {
        //初始化未登录界面
        let customView = VisitorView()
//        customView.backgroundColor = UIColor.red
        customView.delegate = self
        
        view = customView
        visitorView = customView
        
        //设置导航条未登录按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.registerBtnWillClick))
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.loginBtnWillClick))
        
    }
    
     // MARK: - VisitorViewDelegate
    
    func loginBtnWillClick() {
        print(#function)
    }
    func registerBtnWillClick() {
        print(#function)

    }
}
