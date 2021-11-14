//
//  View.swift
//  BudgetApp
//
//  Created by Angelo Essam on 14/11/2021.
//

import Foundation
import SwiftUI



extension View{
    
    func centerHorizontally() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
}
