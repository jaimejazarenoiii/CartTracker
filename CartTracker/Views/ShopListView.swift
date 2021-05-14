//
//  ShopListView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import SwiftUI

struct ShopListView: View {
    @EnvironmentObject var store: AppStore
    @State private var showDialog = false
    @Binding var name: String
    @Binding var budget: Double

    var body: some View {
        NavigationView {
            List {
                ForEach(store.state.shop.shops) { shop in
                    NavigationLink(destination: Text(shop.name)) {
                        Text(shop.name)
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        store.send(.shop(action: .delete(index: index)))
                    }
                })
            }
            .listStyle(PlainListStyle())

            .navigationTitle("Shopping Sessions")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showDialog = true
                                    }) {
                                        Image(systemName: "plus.circle").imageScale(.large)
                                    }
            )
        }
        .ignoresSafeArea()
        Text("")
            .hidden()
            .sheet(isPresented: $showDialog, content: {
                NewShopView(name: $name, budget: $budget)
            })
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView(name: .constant(""), budget: .constant(0.0))
    }
}
