//
//  VisitorView.swift
//  weiboDemo
//
//  Created by MAC on 2017/1/5.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate:NSObjectProtocol {
    //登录回调
    func loginBtnWillClick()
    
    //注册回调
    func registerBtnWillClick()
}

class VisitorView: UIView {

    //定义一个属性保存代理对象
    //一定要加上weak,避免循环使用
    weak var delegate:VisitorViewDelegate?
    
    
 /**
     设置未登录界面
     
     :param: isHome    是否是首页
     :param: imageName 需要展示的图标名称
     :param: message   需要展示的文本内容
     */
    func setupVisitorInfo(_ isHome:Bool,imageName:String,message:String)  {
        //如果不是首页，就隐藏转盘
        iconView.isHidden = !isHome
        //修改中间图标
        homeICon.image = UIImage (named: imageName)
        //修改文本
        messageLabel.text = message
        //是否需要执行动画
        if isHome {
            startAnimation()
        }
    }
    
    
    func loginBtnClick(){
        delegate?.loginBtnWillClick()
    }
    func registerBtnClick(){
        
        delegate?.registerBtnWillClick()
    }

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
    
    
    //MARK: - 内部控制方法
    fileprivate func startAnimation(){
        //1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        //2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        //
        anim.isRemovedOnCompletion = false
        
        iconView.layer.add(anim, forKey: nil)
        
    }
    
   //MARK: - 懒加载控件
    
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
    
    btn.addTarget(self, action:#selector(VisitorView.loginBtnClick), for: UIControlEvents.touchUpInside)
        return btn
        
    }()
    
    ///注册按钮
   fileprivate lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        btn.setTitle("注册", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
    
    btn.addTarget(self, action:#selector(VisitorView.registerBtnClick), for: UIControlEvents.touchUpInside)
    
        return btn
        
    }()

    ///模糊背景图
   fileprivate lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    
    
    
    
}
