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
        VStack(spacing: 0) {
            List {
                ForEach(store.state.shop.shop.items.reversed()) { item in
                    ItemRowView(item: item)
                        .listRowInsets(EdgeInsets())
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        store.send(.shop(action: .removeItem(store.state.shop.shop.items.reversed()[index],
                                                             from: store.state.shop.shop)))
                    }
                })
            }
            .navigationBarTitle(Text("\(shop.name)'s Cart"), displayMode: .large)
            .navigationBarItems(trailing:
                Menu {
                    Button("Add product", action: { showDialog = true })
                Button("Mark as \(shop.status.option)", action: updateStatus)
                } label: {
                    Image(symbol: .ellipsisCircle)
                }
            )
            .onAppear(perform: setShop)
            .sheet(isPresented: $showDialog, content: {
                NewItemView(showDialog: $showDialog)
            })
            ZStack {
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(Color.clear)
                    .edgesIgnoringSafeArea(.bottom)
                    .shadow(color: .black, radius: 10)
                HStack {
                    Spacer()
                    Group {
                        Text("Running Balance: ")
                            .font(.title2.bold())
                        Text(store.state.shop.shop.runningBalance().cleanValue)
                            .foregroundColor(store.state.shop.shop.runningBalance() < 0 ? .red : .green)
                            .font(.title2.bold())
                            .padding(.trailing, 20)
                    }
                }
            }
            .background(Color.clear)
            .clipped()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    private func setShop() {
        store.send(.shop(action: .set(shop: shop)))
    }

    private func updateStatus() {
        store.send(.shop(action: .update(status: shop.status == .active ? .inactive : .active, shop: shop)))
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(shop: Shop(name: "Colonade"))
    }
}
