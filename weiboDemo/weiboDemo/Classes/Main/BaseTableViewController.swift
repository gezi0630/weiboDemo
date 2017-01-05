//
//  BaseTableViewController.swift
//  weiboDemo
//
//  Created by MAC on 2017/1/5.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    //定义一个变量保存用户当前是否登录
    var userLogin = false
    
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
        
    }
    
    
    //MARK: -内部控制方法
    
    /**
     创建未登录界面
 */
    private func setupVisitorView()
    {
        let customView = VisitorView()
//        customView.backgroundColor = UIColor.red
        
        view = customView
    }
}
