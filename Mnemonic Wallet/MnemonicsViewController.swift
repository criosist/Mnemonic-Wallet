//
//  MnemonicsViewController.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class MnemonicsViewController: BaseTabBarViewController {
    
    internal lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .orange
        return table
    }()
    
    internal var tabBarHeight: CGFloat {
        get {
            return tabBarController?.tabBar.frame.height ?? 0
        }
    }
    
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
        
        view.backgroundColor = .purple
    }
    
    private func addTableView() {
        if tableView.superview == nil {
            view.addSubview(tableView)
            NSLayoutConstraint.activate(MnemonicsHelpers.constraintsForPinToSuperViewWithPadding(view: tableView, upPadding: 0, downPadding: tabBarHeight, leftPadding: 0, rightPadding: 0))
        }
    }
    
}
