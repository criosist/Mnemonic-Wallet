//
//  CoreDataManager.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 29/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    static let sharedCoreDataManager: CoreDataManager = CoreDataManager()
    
    /// managed object model
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle(for: type(of: self).self).url(forResource: "MnemonicDataModel", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    /// application documents directory
    private lazy var applicationDocumentsDirectory: NSURL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as NSURL
    }()

    /// persistent store coordinator
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("MnemonicDataModel.sqlite")
        do {
            let mOptions = [NSMigratePersistentStoresAutomaticallyOption: true,
                            NSInferMappingModelAutomaticallyOption: true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: mOptions)
        } catch {
            do {
                try FileManager.default.removeItem(at: url!)
                let mOptions = [NSMigratePersistentStoresAutomaticallyOption: true,
                                NSInferMappingModelAutomaticallyOption: true]
                try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: mOptions)
            } catch {
                fatalError("Couldn't load database: \(error)")
            }
        }
        
        return coordinator
    }()
    
    /// managed object context
    public lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    func save() {
        do {
            try CoreDataManager.sharedCoreDataManager.managedObjectContext.save()
        } catch {
            fatalError("Failed to save core data context: \(error)")
        }
    }
}
