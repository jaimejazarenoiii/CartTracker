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

    var body: some View {
        NavigationView {
            List {
                Section(header: ShopListHeaderView()) {
                    ForEach(store.state.shop.shops) { shop in
                        NavigationLink(destination: ItemListView(shop: shop)) {
                            ShopRow(shop: shop)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            store.send(.shop(action: .delete(shop: store.state.shop.shops[index])))
                        }
                    })
                }
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
            .accessibilityIdentifier("shopList")
        }
        .ignoresSafeArea()
        .onAppear(perform: fetchShops)
        Text("")
            .hidden()
            .sheet(isPresented: $showDialog, content: {
                NewShopView(showDialog: $showDialog)
            })
    }
    
    private func fetchShops() {
        store.send(.shop(action: .getAll))
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}
