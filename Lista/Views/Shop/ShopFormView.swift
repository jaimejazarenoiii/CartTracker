//
//  ShopFormView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/12/21.
//

import SwiftUI

struct ShopFormView: View {
    @EnvironmentObject var store: AppStore
    @State var name: String = ""
    @State var budget: Double = 0.0
    @Binding var showDialog: ItemListView.ActiveSheet?
    var procedure: Procedure = .add
    var id: Int = 0

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                DecimalTextField(L10n.budget.localizedString,
                                 numericValue: $budget)
            }
            .navigationBarItems(
                leading: Button("Cancel",
                                action: {
                                    showDialog = nil
                                }),
                trailing:
                    Button("Save", action: {
                        procedure == .add ? add() : edit()
                        showDialog = nil
                    })
            )
            .navigationBarTitle("\(procedure == .add ? "Add" : "Edit") Shopping Session", displayMode: .inline)
        }
    }

    private func add() {
        let shop = Shop(name: name, budgetAmount: budget)
        store.send(.shop(action: .add(shop: shop)))
    }

    private func edit() {
        store.send(.shop(action: .edit(id: id, name: name, budgetAmount: budget)))
    }
}

struct ShopFormView_Previews: PreviewProvider {
    static var previews: some View {
        ShopFormView(name: "",
                     budget: 0.0,
                     showDialog: .constant(.add))
    }
}
