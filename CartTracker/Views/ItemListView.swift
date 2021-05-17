//
//  ItemListView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var store: AppStore
    @State private var showDialog = false
    var shop: Shop
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Running Balance: ")
                    .font(.title2)
                Text(String(format: "%.2f", store.state.shop.shop.runningBalance()))
                    .foregroundColor(store.state.shop.shop.runningBalance() < 0 ? .red : .green)
                    .font(.title2)
            }
            List {
                Section(header: ItemListHeaderView()) {
                    ForEach(store.state.shop.shop.items.reversed()) { item in
                        ItemRow(item: item)
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            store.send(.shop(action: .removeItem(store.state.shop.shop.items.reversed()[index],
                                                                 from: store.state.shop.shop)))
                        }
                    })
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("\(shop.name)'s Cart")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showDialog = true
                                    }) {
                                        Image(systemName: "plus.circle").imageScale(.large)
                                    }
            )
            .onAppear(perform: setShop)
        }
        Text("")
            .hidden()
            .sheet(isPresented: $showDialog, content: {
                NewItemView(showDialog: $showDialog)
            })
    }
    
    private func setShop() {
        store.send(.shop(action: .set(shop: shop)))
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}
