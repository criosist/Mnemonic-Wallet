//
//  String+Mnemonic.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 05/10/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import Foundation

extension String {
    func containsOnlyCharacters() -> Bool {
        return range(of: "^[a-zA-Z]+$", options: .regularExpression) != nil
    }
    
    func containsSpaces() -> Bool {
        return self.contains(" ")
    }
}
