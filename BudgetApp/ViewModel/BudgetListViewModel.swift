//
//  File.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import CoreData

@MainActor
class BudgetListViewModel :NSObject, ObservableObject{
    
    private (set) var context : NSManagedObjectContext
    @Published var budgets = [BudgetViewModel]()
    private let fetechedResultsController : NSFetchedResultsController<Budget>
    
    init(context : NSManagedObjectContext){
        self.context = context
        fetechedResultsController = NSFetchedResultsController(fetchRequest: Budget.all , managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetechedResultsController.delegate = self
        
        do{
            try fetechedResultsController.performFetch()
            guard let budget = fetechedResultsController.fetchedObjects as? [Budget] else{
                return
            }
            self.budgets = budget.map(BudgetViewModel.init)
            
        }catch{
            print(error)
        }
    }
    
    func deleteBudget(budegetID : NSManagedObjectID){
        do {
            guard let budget = try context.existingObject(with: budegetID) as? Budget else{
               return
            }
            
            try budget.delete()
        }catch{
            print(error)
        }
    }
    
}

extension BudgetListViewModel : NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let budget = controller.fetchedObjects as? [Budget] else{
            return
        }
        self.budgets = budget.map(BudgetViewModel.init)
    }
}

struct BudgetViewModel : Identifiable{
    
    private var budget: Budget
    
    init(budget: Budget){
        self.budget = budget
    }
    
    var id : NSManagedObjectID {
        return budget.objectID
    }
    
    var title : String {
        return budget.title ?? ""
    }
    
    var total : Double {
        return budget.total
    }
    
}

