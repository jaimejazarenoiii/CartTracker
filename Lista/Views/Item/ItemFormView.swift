//
//  ItemFormView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ItemFormView: View {
    @EnvironmentObject var store: AppStore
    @Binding var showDialog: ItemListView.ActiveSheet?
    @State var name: String = ""
    @State var quantity: String = ""
    @State var price: String = ""
    var procedure: Procedure = .add
    var id: Int = 0
    var shop: Shop

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Quantity", text: $quantity)
                TextField("Price", text: $price)
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
            .navigationBarTitle("\(procedure == .add ? "Add" : "Edit") Item", displayMode: .inline)
        }
    }

    private func add() {
        let item = Item(name: name,
                        quantity: Double(quantity) ?? 0.0,
                        price: Double(price) ?? 0.0)
        store.send(.item(action: .add(item, to: shop)))
        store.send(.item(action: .all(from: shop)))
        store.send(.shop(action: .set(shop: shop)))
    }

    private func edit() {
        store.send(.item(action: .edit(id: id,
                                       name: name,
                                       quantity: Double(quantity) ?? 0.0,
                                       price: Double(price) ?? 0.0,
                                       shopId: shop.id)))
        store.send(.shop(action: .set(shop: shop)))
    }
}

struct ItemFormView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFormView(showDialog: .constant(.add),
                     name: "",
                     quantity: "",
                     price: "",
                     shop: Shop(name: "Colonade"))
    }
}
