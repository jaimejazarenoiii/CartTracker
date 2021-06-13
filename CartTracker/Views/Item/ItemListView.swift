//
//  ItemListView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ItemListView: View {
    enum ActiveSheet: Identifiable {
        case add, edit

        var id: Int {
            hashValue
        }
    }

    @EnvironmentObject var store: AppStore
    @State var activeSheet: ActiveSheet?
    var shop: Shop

    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(store.state.item.items.reversed()) { item in
                    ItemRowView(item: item)
                        .listRowInsets(EdgeInsets())
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        store.send(.item(action: .delete(item: store.state.item.items.reversed()[index],
                                                         from: store.state.shop.shop)))
                        store.send(.shop(action: .set(shop: shop)))
                    }
                })
            }
            .navigationBarTitle(Text("\(store.state.shop.shop.name)'s Cart"), displayMode: .large)
            .navigationBarItems(trailing:
                Menu {
                    Button(action: { activeSheet = .add }) {
                        Text("Add product")
                        Image(symbol: .plus)
                    }
                    Button(action: { activeSheet = .edit }) {
                        Text("Edit Shopping Session Details")
                        Image(symbol: .pencil)
                    }
                    Button(action: updateStatus) {
                        Text("Mark as \(store.state.shop.shop.status.option)")
                        Image(symbol: .pencilTipCropCircle)
                    }
                } label: {
                    Image(symbol: .ellipsisCircle)
                }
            )
            .onAppear(perform: setupData)
            ZStack {
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(Color.clear)
                    .edgesIgnoringSafeArea(.bottom)
                    .shadow(color: .black, radius: 10)
                HStack {
                    Spacer()
                    Group {
                        Text(LocalizedString.balance.localized)
                            .font(Font.title2.bold())
                        Text(store.state.shop.shop.runningBalance().cleanValue)
                            .foregroundColor(store.state.shop.shop.runningBalance() < 0 ? .red : .green)
                            .font(Font.title2.bold())
                            .padding(.trailing, 20)
                    }
                }
            }
            .background(Color.clear)
            .clipped()
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.bottom)
        .sheet(item: $activeSheet) { item in
            switch item {
            case .add:
                ItemFormView(showDialog: $activeSheet, shop: store.state.shop.shop)
            case .edit:
                ShopFormView(name: store.state.shop.shop.name,
                             budget: String(store.state.shop.shop.budgetAmount),
                             showDialog: $activeSheet,
                             procedure: .edit,
                             id: store.state.shop.shop.id)
            }

        }
    }

    private func setupData() {
        setShop()
        fetchItems()
    }

    private func setShop() {
        store.send(.shop(action: .set(shop: shop)))
    }

    private func fetchItems() {
        store.send(.item(action: .all(from: store.state.shop.shop)))
    }

    private func updateStatus() {
        store.send(.shop(
            action: .update(status: store.state.shop.shop.status == .active ? .inactive : .active,
                            shop: store.state.shop.shop))
        )
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(shop: Shop(name: "Colonade"))
    }
}
