//
//  BaseModel.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import CoreData


protocol BaseModel{
    static var viewContext : NSManagedObjectContext { get }
    func save() throws
    func delete() throws
    
}


extension BaseModel where Self : NSManagedObject {
    static var viewContext : NSManagedObjectContext{
        return CoreDataManager.shared.persistentStoreContainer.viewContext
    }
    
    func save() throws{
        try Self.viewContext.save()
    }
    
    func delete() throws{
        Self.viewContext.delete(self)
        try save()
    }
}
