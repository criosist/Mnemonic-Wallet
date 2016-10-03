//
//  Mnemonic+CoreDataClass.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 03/10/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import Foundation
import CoreData


public class Mnemonic: NSManagedObject {

    class func storePotentialMnemonic(newPotentialMnemonic: PotentialMnemonic) {
        let _ = createMnemonicFromPotentialMnemonic(potentialMnemonic: newPotentialMnemonic)
        CoreDataManager.shared.save()
    }
    
    private class func encodeMnemonic(mnemonicArray: [String]) -> String {
        return ""
    }
    
    private class func createMnemonicFromPotentialMnemonic(potentialMnemonic: PotentialMnemonic) -> Mnemonic? {
        guard let decodedMnemonic = potentialMnemonic.mnemonic else {
            return nil
        }
        
        let context = CoreDataManager.shared.managedObjectContext
        
        let mnemonic = createNewMnomonic(context: context)
        
        let encodedMnemonic = encodeMnemonic(mnemonicArray: decodedMnemonic)
        
        mnemonic.mnemonicEncoded = encodedMnemonic
        
        mnemonic.mnemonicTitle = potentialMnemonic.title
        
        mnemonic.mnemonicDescription = potentialMnemonic.description
        
        mnemonic.createdDate = NSDate()
        
        return mnemonic
    }
    
    private class func createNewMnomonic(context: NSManagedObjectContext) -> Mnemonic {
        return NSEntityDescription.insertNewObject(forEntityName: String(describing: Mnemonic.self), into: context) as! Mnemonic
    }
}
