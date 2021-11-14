//
//  SwiftUIView.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import SwiftUI

struct AddBudgetView: View {
    
    @ObservedObject var vm : AddBudgetViewModel
    
    init(vm:AddBudgetViewModel){
        self.vm = vm
    }
    
    var body: some View {
        Form{
            TextField("Enter the Title",text: $vm.title)
            TextField("Enter the Total",text: $vm.total)
            Button("Save"){
                vm.save()
//                PresentationMode.wrappedValue
                
            }.centerHorizontally()
            
                .navigationTitle("Add New Budget")
        }
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(vm: AddBudgetViewModel(viewcontext: viewContext))
    }
}
