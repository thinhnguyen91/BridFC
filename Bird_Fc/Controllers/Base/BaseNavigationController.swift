//
//  BaseNavigationController.swift
//  PageMenu
//
//  Created by Thinh Nguyen on 11/22/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = UIColor.white
        navigationBar.barTintColor = UIColor.clear
        isNavigationBarHidden = true
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
}
