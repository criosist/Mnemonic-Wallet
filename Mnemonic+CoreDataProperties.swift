//
//  Mnemonic+CoreDataProperties.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 29/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import Foundation
import CoreData


extension Mnemonic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mnemonic> {
        return NSFetchRequest<Mnemonic>(entityName: "Mnemonic");
    }

    @NSManaged public var mnemonicEncoded: String?
    @NSManaged public var mnemonicTitle: String?
    @NSManaged public var mnemonicDescription: String?

}
