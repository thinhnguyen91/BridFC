//
//  HomeViewController.swift
//  Bird_Fc
//
//  Created by Thinh Nguyen on 12/12/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit
import PageMenu
import SwiftUtils

enum DefaultMenuItem: Int {
    case nhieuLoai
    case chaoMaos
    
    var title: String {
        switch self {
        case .nhieuLoai:
            return "Khác"
        case .chaoMaos:
            return "Chào Mào"
        }
    }
}
class HomeViewController: BaseViewController {
    
    @IBOutlet weak var viewOfPageMenu: UIView!
    @IBOutlet weak var viewBander: UIView!
    var pageMenu : CAPSPageMenu?
    var controllerArray : [UIViewController] = []
    var indexToPage = 0
    lazy var chaoMaoViewController = ChaoMaoViewController.vc()
    lazy var nhiueLoaiVewController = NhieuLoaiViewController.vc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
    }
    override func viewWillAppear(_ animated: Bool) {
        self.parametersOfPageMenu()
    }
    override func setUpData() {
        
    }
    
    override func setUpUI() {
        self.setListViewController()
        
    }
    
    fileprivate func setListViewController() {
        self.nhiueLoaiVewController.title = DefaultMenuItem.nhieuLoai.title
        controllerArray.append(nhiueLoaiVewController)
        self.chaoMaoViewController.title = DefaultMenuItem.chaoMaos.title
        controllerArray.append(chaoMaoViewController)
    }
    
    fileprivate func parametersOfPageMenu()  {
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(Color.ScrollMenu),
            .viewBackgroundColor(Color.ViewBackgroundColor),
            .selectionIndicatorColor(Color.Green122),
            .bottomMenuHairlineColor(Color.BottomMenuHairline),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 16.0)!),
            .menuHeight(40.0),
            .menuItemWidth(UIScreen.main.bounds.width/2),
            .menuMargin(0.0),
            .selectedMenuItemLabelColor(Color.Green122),
            .scrollMenuBackgroundColor(UIColor.black),
            .menuMargin(0.0),
            ]
        let framePage = CGRect(x: 0.0,
                               y: 64,
                               width: self.view.frame.width,
                               height: self.view.frame.height)
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: framePage, pageMenuOptions: parameters)
        pageMenu?.delegate = self
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
    }
    
    // MARK: - Container View Controller
    override var shouldAutomaticallyForwardAppearanceMethods : Bool {
        return true
    }
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - CAPSPageMenuDelegate
extension HomeViewController: CAPSPageMenuDelegate {
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        indexToPage = index
    }
}
