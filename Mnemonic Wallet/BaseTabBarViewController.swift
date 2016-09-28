//
//  BaseViewController.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit



class BaseTabBarViewController: UIViewController {
    
    init(tabBarLayout: TabBarLayout?) {
        
        super.init(nibName: nil, bundle: nil)
        
        if let tabBarLayout = tabBarLayout {
            configureForTabbar(layout: tabBarLayout)
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    private func configureForTabbar(layout: TabBarLayout) {
        tabBarItem.title = layout.title
        tabBarItem.image = layout.image
    }
}
