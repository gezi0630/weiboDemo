//
//  VisitorView.swift
//  weiboDemo
//
//  Created by MAC on 2017/1/5.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        //1、添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeICon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        //2、布局子控件
        //2、1设置环形背景
        iconView.xmg_AlignInner(XMG_AlignType.center, referView: self, size: nil)
        //2.2设置小房子
        homeICon.xmg_AlignInner(XMG_AlignType.center, referView: self, size: nil)
        //2.3设置文本
        messageLabel.xmg_AlignVertical(XMG_AlignType.bottomCenter, referView: iconView, size: nil)
        
        // "哪个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
    
        let widthCons = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        
        //2.4设置按钮
        registerButton.xmg_AlignVertical(XMG_AlignType.bottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 30),offset: CGPoint(x: 0, y: 20))
        
        loginButton.xmg_AlignVertical(XMG_AlignType.bottomRight, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        //2.5设置模糊背景图
        maskBGView.xmg_Fill(self)
        
    }
    
    
    // Swift推荐我们自定义一个控件,要么用纯代码, 要么就用xib/stroyboard
    required init?(coder aDecoder: NSCoder) {
        // 如果通过xib/stroyboard创建该类, 那么就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
   //MARK:懒加载控件
    
    ///转盘
   fileprivate lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    
   ///房子图标
   fileprivate lazy var homeICon: UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
        
        return iv
    }()
    
    
    ///文本
   fileprivate lazy var messageLabel: UILabel = {
        let label = UILabel()
    
      label.numberOfLines = 0
      label.textColor = UIColor.darkGray
      label.text = "打算；积分；就；安居房；加加；房间爱家；加加；发奖金啊；"
        return label
        
    }()
    
    ///登录按钮
   fileprivate lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
        return btn
        
    }()
    
    ///注册按钮
   fileprivate lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        btn.setTitle("注册", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
        return btn
        
    }()

    ///模糊背景图
   fileprivate lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    
    
    
    
}
