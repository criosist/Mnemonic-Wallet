//
//  MnemonicsViewController.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class MnemonicsViewController: BaseTabBarViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    init() {
        let layout = TabBarLayout(title: "Mnemonics", image: nil)
        
        super.init(tabBarLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }
    
}

// View Layout
extension MnemonicsViewController {

    func buildUI() {
        
    }
    
}
