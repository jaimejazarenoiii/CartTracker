//
//  NewItemView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct NewItemView: View {
    @EnvironmentObject var store: AppStore
    @Binding var showDialog: Bool
    @State var name: String = ""
    @State var quantity: String = ""
    @State var price: String = ""

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
                                    showDialog = false
                                }),
                trailing:
                    Button("Save", action: {
                        store.send(
                            .shop(
                                action: .addItem(
                                    Item(name: name,
                                         quantity: Double(quantity) ?? 0.0,
                                         price: Double(price) ?? 0.0),
                                    to: store.state.shop.shop
                                )
                            )
                        )
                        showDialog = false
                    })
            )
            .navigationBarTitle("Add Item", displayMode: .inline)
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(showDialog: .constant(false),
                    name: "",
                    quantity: "",
                    price: "")
    }
}
