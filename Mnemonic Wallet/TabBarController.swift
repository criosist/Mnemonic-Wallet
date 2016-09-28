//
//  TabBarController.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy var mnemonics: MnemonicsViewController = {
        let mnemonicsVC = MnemonicsViewController()
        return mnemonicsVC
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.viewControllers = [mnemonics]
    }
    
    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !userHasRegistered() {
            presentLockedScreen(animated: true)
        }
    }
    

}

// Registration / Locking
extension TabBarController {
    
    func userHasRegistered()-> Bool {
        return true
    }
    
    func presentRegistration(animated: Bool) {
        
    }
    
    func presentLockedScreen(animated: Bool) {
        
    }
    
}
