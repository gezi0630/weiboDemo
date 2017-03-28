//
//  QRCodeViewController.swift
//  weiboDemo
//
//  Created by MAC on 2017/3/28.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    
    
    @IBAction func closeBtnClick(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var customTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customTabBar.selectedItem = customTabBar.items![0]
        
    }

   
    
    
    
    
    
}
