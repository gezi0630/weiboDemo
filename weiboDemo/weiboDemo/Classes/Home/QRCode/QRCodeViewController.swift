//
//  QRCodeViewController.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/28.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController,UITabBarDelegate {

    //扫描容器高度约束
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    //冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    //冲击波视图顶部约束
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
    
    @IBAction func closeBtnClick(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var customTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.设置底部视图默认选中第0个

        customTabBar.selectedItem = customTabBar.items![0]
        self.customTabBar.delegate = self
        
           }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startAnimation()

    }
   /**
    *执行动画
    */
 fileprivate func startAnimation()
   {
    
    //让约束从顶部开始
    self.scanLineCons.constant = -self.containerHeightCons.constant
    self.scanLineView.layoutIfNeeded()
    
    //执行冲击波动画
    UIView.animate(withDuration: 2.0) { 
        //1.修改约束
        self.scanLineCons.constant = self.containerHeightCons.constant
        
        //设置动画指定的次数
        UIView.setAnimationRepeatCount(MAXFLOAT)
        
        //2.强制更新界面
        self.scanLineView.layoutIfNeeded()
    }
    
    
    }
    
    //MARK: - UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //1.修改容器高度
        if item.tag == 1 {
            //二维码
            self.containerHeightCons.constant = 300
        }else
        {
            self.containerHeightCons.constant = 150
        }
        
        //2.停止动画
        
        self.scanLineView.layer.removeAllAnimations()
        //3.重新开始动画
        startAnimation()
    }
    
    
    
}
