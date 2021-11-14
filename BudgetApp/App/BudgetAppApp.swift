//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            // load viewContent
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext) // now the content is aviable in all childreen
        }
    }
}
