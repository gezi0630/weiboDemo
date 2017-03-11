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
       btn.isSelected = !btn.isSelected
        //2、弹出菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        // 2.1设置转场代理
        // 默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
        // 如果自定义转场, 那么就不会移除以前控制器的view

        vc?.transitioningDelegate = self
        
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

//在扩展的地方写回调方法
extension HomeViewController:
       UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
{
    // 实现代理方法, 告诉系统谁来负责转场动画
    // UIPresentationController iOS8推出的专门用于负责转场动画的
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
// MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西都需要程序员自己来实现

    
    /// 告诉系统谁来负责Modal的展现动画
    ///
    /// - Parameters:
    ///   - presented: 被展现的视图
    ///   - presenting: 发起的视图
    ///   - source:
    /// - Returns: 谁来负责
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        return self
    }
    
    
    /// 告诉系统谁来负责Modal的消失动画
    ///
    /// - Parameter dismissed: 被关闭的视图
    /// - Returns: 谁来负责
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = false
        
        return self
    }
    
    //MARK: - UIViewControllerAnimatedTransitioning
    
    
    /// 返回动画时长
    ///
    /// - Parameter transitionContext: 上下文，里边保存了动画需要的所有参数
    /// - Returns: 动画时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    
    /// 告诉系统如何动画，无论是展现还是消失都会调用这个方法
    ///
    /// - Parameter transitionContext: 上下文，里边保存了动画需要的所有参数

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        
        
        if isPresent {
            //展开
            // 1.拿到展现视图
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            //先将视图压扁
            toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
            
            //注意：一定要将视图添加到容器上
            transitionContext.containerView.addSubview(toView!)
            //设置锚点
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
           //2.执行动画
            UIView.animate(withDuration: 0.5, animations: { 
                
                //2.1 清空 transform
            toView?.transform = CGAffineTransform.identity
                
            }, completion: { (_) in
                
                // 2.2动画执行完毕, 一定要告诉系统
                // 如果不写, 可能导致一些未知错误
                transitionContext.completeTransition(true)
            })
        }
        else
        {
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            UIView.animate(withDuration: 0.2, animations: { 
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
            }, completion: { (_) in
                // 如果不写, 可能导致一些未知错误
                transitionContext.completeTransition(true)
            })
            
        }
        
        
    }
    
    
    
    
    
    
}




