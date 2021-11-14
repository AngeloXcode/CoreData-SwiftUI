//
//  AddBudgetViewModel.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import CoreData

class AddBudgetViewModel : ObservableObject{
    
    private (set) var viewcontext : NSManagedObjectContext
    
    @Published var title :String = ""
    @Published var total :String = ""
    
    init(viewcontext : NSManagedObjectContext){
        self.viewcontext = viewcontext
    }
    
    
    func save(){
        do{
          let budget = Budget(context: viewcontext)
            budget.title = title
            budget.total = Double(total) ?? 0
            try budget.save()
        }catch{
            print(error)
        }
    }
}
