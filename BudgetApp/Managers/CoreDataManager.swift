//
//  CoreDataManager.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import CoreData


class CoreDataManager {
    
    let persistentStoreContainer :  NSPersistentContainer
    static let shared = CoreDataManager()
    
    
    private init(){
        persistentStoreContainer = NSPersistentContainer(name: "BudgetAppModel")
        persistentStoreContainer.loadPersistentStores { desc, error in
            if let error = error{
                fatalError("Unable to initlization Core Data \(error)")
            }
        }
    }
}
