//
//  UserAccessManager.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class UserAccessManager {
    
    private static let USER_ACCESS_CODE_KEY: String = "kMnemonic_Defaults_Access_Key"
    
    private class func fetchCode() -> String? {
        return UserDefaults.standard.string(forKey: USER_ACCESS_CODE_KEY)
    }

    class func applicationHasRegisteredUserCode() -> Bool {
        if let _ = fetchCode() {
            return true
        }
        return false
    }
    
    class func attemptAccessCodeMatch(potentialCode: String) -> Bool {
        if let currentCode = fetchCode(), currentCode == potentialCode {
            return true
        }
        return false
    }
    
    class func registerNewCode(newCode: String) {
        UserDefaults.standard.setValue(newCode, forKey: USER_ACCESS_CODE_KEY)
    }
    
}
