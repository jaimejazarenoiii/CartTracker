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
                    NavigationLink(destination: ItemListView(shop: shop)) {
                        ShopRowView(shop: shop)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        store.send(.shop(action: .delete(shop: store.state.shop.shops[index])))
                    }
                })
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(LocalizedString.shoppingSessions.localized)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showDialog = true
                    }
                ) {
                    Image(symbol: .plusCircle).imageScale(.large)
                }
            )
            .ignoresSafeArea()
            .sheet(isPresented: $showDialog) {
                NewShopView(showDialog: $showDialog)
            }
            .accessibilityIdentifier("shopList")
        }
        .onAppear(perform: fetchShops)
    }

    private func fetchShops() {
        store.send(.shop(action: .getAll))
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
            .environmentObject(AppStore(initialState: .init(), reducer: appReducer, environment: World()))
    }
}
