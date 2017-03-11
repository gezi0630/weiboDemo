//
//  UIBarButtonItem+Category.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/8.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
     // 如果在func前面加上class, 就相当于OC中的+
    
    class func creatBarButtonItem(imageName:String,target:AnyObject?,action:Selector)->UIBarButtonItem {
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: UIControlState.normal)
        btn.setImage(UIImage(named:imageName+"_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.sizeToFit()
        
        return UIBarButtonItem(customView: btn)
    }
    
}








