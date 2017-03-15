//
//  PopoverAnimator.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/15.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

// 定义常量保存通知的名称
let XMGPopoverAnimatorWillShow = "XMGPopoverAnimatorWillShow"
let XMGPopoverAnimatorWilldismiss = "XMGPopoverAnimatorWilldismiss"

class PopoverAnimator: NSObject,UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    /// 记录当前是否是展开
    var isPresent: Bool = false
    /// 定义属性保存菜单的大小
    var presentFrame = CGRect.zero
    
    // 实现代理方法, 告诉系统谁来负责转场动画
    // UIPresentationController iOS8推出的专门用于负责转场动画的
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        let pc = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        // 设置菜单的大小
        pc.presentFrame = presentFrame
        return pc
    }
    
    // MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西都需要程序员自己来实现
    /**
     告诉系统谁来负责Modal的展现动画
     
     :param: presented  被展现视图
     :param: presenting 发起的视图
     :returns: 谁来负责
     */
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = true
        // 发送通知, 通知控制器即将展开
        NotificationCenter.default.post(name: Notification.Name(rawValue: XMGPopoverAnimatorWillShow), object: self)
        return self
    }
    
    /**
     告诉系统谁来负责Modal的消失动画
     
     :param: dismissed 被关闭的视图
     
     :returns: 谁来负责
     */
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = false
        // 发送通知, 通知控制器即将消失
        NotificationCenter.default.post(name: Notification.Name(rawValue: XMGPopoverAnimatorWilldismiss), object: self)
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    /**
     返回动画时长
     
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     
     :returns: 动画时长
     */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.2
    }
    
    /**
     告诉系统如何动画, 无论是展现还是消失都会调用这个方法
     
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     */
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        // 1.拿到展现视图
        if isPresent
        {
            // 展开
            print("展开")
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0);
            
            // 注意: 一定要将视图添加到容器上
            transitionContext.containerView.addSubview(toView)
            
            // 设置锚点
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            // 2.执行动画
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                // 2.1清空transform
                toView.transform = CGAffineTransform.identity
            }, completion: { (_) -> Void in
                // 2.2动画执行完毕, 一定要告诉系统
                // 如果不写, 可能导致一些未知错误
                transitionContext.completeTransition(true)
            })
        }else
        {
            // 关闭
            print("关闭")
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                // 注意:由于CGFloat是不准确的, 所以如果写0.0会没有动画
                // 压扁
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
            }, completion: { (_) -> Void in
                // 如果不写, 可能导致一些未知错误
                transitionContext.completeTransition(true)
            })
        }
    }
    
}
