//
//  BaseViewController.swift
//  PageMenu
//
//  Created by Thinh Nguyen on 11/22/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit
//import MBProgressHUD

protocol BaseViewControllerProtocol: class {
    func baseViewControllerGetName(_ isCardHomeVC: Bool)
}

class BaseViewController: UIViewController {
    //    private var spinnerActivity: MBProgressHUD?
    // MARK: - Init
    
    init() {
        let className = NSStringFromClass(type(of: self)).components(separatedBy: ".").last
        if let _ = Bundle.main.path(forResource: className, ofType: "nib") {
            super.init(nibName: className, bundle: nil)
        } else {
            super.init()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setUpData()
        self.setUpUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //hideLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    // MARK: - Setup
    func setUpUI() {
        
    }
    
    func setUpData() {
        //        spinnerActivity = MBProgressHUD()
    }
    
    // MARK: - Status Bar
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func close() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Progress
    //    func showLoading() {
    //        spinnerActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    //        spinnerActivity!.userInteractionEnabled = false
    //    }
    
    //    func hideLoading() {
    //        spinnerActivity?.hideAnimated(true)
    //        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    //    }
    
    fileprivate func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass)
    }
    
}
