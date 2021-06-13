//
//  NewShopView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/14/21.
//

import Foundation
import SwiftUI

struct NewShopView: View {
    @EnvironmentObject var store: AppStore
    @State var name: String = ""
    @State var budget: String = ""
    @Binding var showDialog: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Budget", text: $budget)
            }
            .navigationBarItems(
                leading: Button("Cancel",
                                action: {
                                    showDialog = false
                                }),
                trailing:
                    Button("Save", action: {
                        store.send(.shop(action: .add(shop: Shop(name: name, budgetAmount: Double(budget) ?? 0.0))))
                        showDialog = false
                    })
            )
            .navigationBarTitle("Add Shopping Session", displayMode: .inline)
        }
    }
}

struct NewShopView_Previews: PreviewProvider {
    static var previews: some View {
        NewShopView(name: "",
                    budget: "",
                    showDialog: .constant(false))
    }
}
