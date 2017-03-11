//
//  PopoverPresentationController.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/10.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {

    
      /// 初始化方法，用于创建负责转场动画的对象
      ///
      /// - Parameters:
      ///   - presentedViewController: 被展现的控制器
    ///   - presentingViewController: 发起的控制器 ，Xocde6是nil, Xcode7是野指针

    
      override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        
    }
    
    
    /**
     即将布局转场子视图时调用
     */
    
    override func containerViewWillLayoutSubviews() {
        // 1.修改弹出视图的大小
        //        containerView; // 容器视图
        //        presentedView() // 被展现的视图
        
        presentedView?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        
        // 2.在容器视图上添加一个蒙版, 插入到展现视图的下面
        // 因为展现视图和蒙版都在都一个视图上, 而后添加的会盖住先添加的
    
    containerView?.insertSubview(coverView, at: 0)
        
        
    }
    
    
    //MARK: - 懒加载
    
    lazy var coverView: UIView = {
        let view = UIView()
        //1、创建view
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        //2.添加监听
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.close))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    func close(){
        
         // presentedViewController拿到当前弹出的控制器
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
