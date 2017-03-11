//
//  TitleButton.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/8.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
   
        setTitleColor(UIColor.darkGray, for: UIControlState())
        setImage(UIImage(named:"navigationbar_arrow_down"), for: UIControlState())
        setImage(UIImage(named:"navigationbar_arrow_up"), for: UIControlState.selected)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
    
    
}
