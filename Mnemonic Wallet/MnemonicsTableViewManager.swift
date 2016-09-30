//
//  MnemonicsTableViewManager.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 30/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class MnemonicsTableViewManager: NSObject {
    
}

extension MnemonicsTableViewManager: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
