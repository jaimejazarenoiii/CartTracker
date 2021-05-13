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
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .listStyle(PlainListStyle())
            .background(Color.red)
            .alert(isPresented: $showDialog,
                   TextAlert(title: "Enter name or title",
                             message: "") { result in
                    store.send(.shop(action: .add(shop: Shop(name: result ?? ""))))
                   })
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
    }
}
struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}
