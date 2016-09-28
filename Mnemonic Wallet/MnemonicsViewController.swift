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
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        let layout = TabBarLayout(title: "Mnemonics", image: UIImage(named: "code"))
        
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
        addTableView()
    }
    
    private func addTableView() {
        if tableView.superview == nil {
            view.addSubview(tableView)
            NSLayoutConstraint.activate(MnemonicsHelpers.constraintsForPinToSuperView(view: tableView))
        }
    }
    
}
