//
//  HomeViewController.swift
//  weiboDemo
//
//  Created by MAC on 2016/12/23.
//  Copyright © 2016年 GuoDongge. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            visitorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
       
        setupNav()
        
        // 3.注册通知, 监听菜单
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.change), name: NSNotification.Name(rawValue: XMGPopoverAnimatorWillShow), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.change), name: NSNotification.Name(rawValue: XMGPopoverAnimatorWilldismiss), object: nil)

        
    }

    
    deinit
    {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    /**
     修改标题按钮的状态
     */
    func change(){
        // 修改标题按钮的状态
        let titleBtn = navigationItem.titleView as! TitleButton
        titleBtn.isSelected = !titleBtn.isSelected
    }
    

    
  private func setupNav()
  {
    //初始化左右按钮
    navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftItemClick))
    
    navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_pop", target: self, action:#selector(HomeViewController.rightItemClick))
    
    //初始化标题按钮
    let titleBtn = TitleButton()
    titleBtn.setTitle("冬哥的爱 ", for: UIControlState())
    titleBtn.addTarget(self, action: #selector(titleBtnClick), for: UIControlEvents.touchUpInside);
    navigationItem.titleView = titleBtn
    
}
    func titleBtnClick(btn : TitleButton){
        //1.修改箭头的方向
//       btn.isSelected = !btn.isSelected
        //2、弹出菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        // 2.1设置转场代理
        // 默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
        // 如果自定义转场, 那么就不会移除以前控制器的view

        vc?.transitioningDelegate = popverAnimator
        
        //2.2设置转场样式
        vc?.modalPresentationStyle = UIModalPresentationStyle.custom
        present(vc!, animated: true, completion: nil)
    }
    
    func leftItemClick()
    {
        print(#function)
    }
    func rightItemClick()
    {
        print(#function)
    }
    
    
    //记录当前是否展开
    var isPresent:Bool = false
    
    
}

// MARK: - 懒加载
// 一定要定义一个属性来报错自定义转场对象, 否则会报错
fileprivate var popverAnimator:PopoverAnimator = {
    let pa = PopoverAnimator()
    pa.presentFrame = CGRect(x: 100, y: 56, width: 200, height: 350)
    return pa
}()




