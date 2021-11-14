//
//  Budget+Extension.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import CoreData

extension Budget : BaseModel {
    
    static var all:NSFetchRequest<Budget>{
        let request = Budget.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
