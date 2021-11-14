//
//  ContentView.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import SwiftUI

struct ContentView: View {
    //properties
    @State private var isPresented : Bool = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var budgetViewModel : BudgetListViewModel
    
    //init
    init(vm : BudgetListViewModel){
        self.budgetViewModel = vm
    }
    // delete Budget
    private func deleteBudget(at offests : IndexSet){
        offests.forEach { index in
            let budget = budgetViewModel.budgets[index]
            budgetViewModel.deleteBudget(budegetID : budget.id)
        }
    }
    //Body
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(budgetViewModel.budgets){ budget in
                        Text(budget.title)
                    }.onDelete(perform:deleteBudget )
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                //dismiss
            }, content: {
                AddBudgetView(vm:AddBudgetViewModel(viewcontext:viewContext))
            })
            .navigationTitle("Budgets")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add New Budget"){
                        self.isPresented.toggle()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: BudgetListViewModel(context: viewContext))
    }
}
