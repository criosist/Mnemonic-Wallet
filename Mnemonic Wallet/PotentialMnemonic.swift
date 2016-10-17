//
//  PotentialMnemonic.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 03/10/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import Foundation

struct PotentialMnemonic {
    var title: String?
    var description: String?
    var mnemonic: [String]?
    
    mutating func appendMnemonic(word: String) {
        if word.containsOnlyCharacters() {
            mnemonic?.append(word)
        }
    }
}
