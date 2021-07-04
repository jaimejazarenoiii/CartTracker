//
//  ItemListView.swift
//  Lista
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
        if store.state.item.items.isEmpty {
            EmptyListView(text: "No item in your cart yet. Add now.")
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing: menuView)
                .onAppear(perform: setupData)
                .sheet(item: $activeSheet) { item in
                    switch item {
                    case .add:
                        ItemFormView(showDialog: $activeSheet, shop: store.state.shop.shop)
                    case .edit:
                        ShopFormView(name: store.state.shop.shop.name,
                                     budget: store.state.shop.shop.budgetAmount,
                                     showDialog: $activeSheet,
                                     procedure: .edit,
                                     id: store.state.shop.shop.id)
                    }

                }
        } else {
            VStack(alignment: .leading, spacing: 20) {
                List {
                    Section(header: Text("\(store.state.shop.shop.name)'s Cart: \(store.state.shop.shop.budgetAmount.cleanValue) budget")) {
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
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing: menuView)
                .onAppear(perform: setupData)
                totalBottomView
            }
            .background(Color(.systemGroupedBackground))
            .edgesIgnoringSafeArea(.bottom)
            .sheet(item: $activeSheet) { item in
                switch item {
                case .add:
                    ItemFormView(showDialog: $activeSheet, shop: store.state.shop.shop)
                case .edit:
                    ShopFormView(name: store.state.shop.shop.name,
                                 budget: store.state.shop.shop.budgetAmount,
                                 showDialog: $activeSheet,
                                 procedure: .edit,
                                 id: store.state.shop.shop.id)
                }

            }
        }
    }

    private var menuView: some View {
        Menu {
            Button(action: { activeSheet = .add }) {
                Text(L10n.addProduct.localizedString)
                Image(symbol: .plus)
            }
            Button(action: { activeSheet = .edit }) {
                Text(L10n.editShoppingSessionDetails.localizedString)
                Image(symbol: .pencil)
            }
            Button(action: updateStatus) {
                Text("Mark as \(store.state.shop.shop.status.option)")
                Image(symbol: .pencilTipCropCircle)
            }
        } label: {
            Image(symbol: .ellipsisCircle)
        }
    }

    private var totalBottomView: some View {
        ZStack {
            Rectangle()
                .frame(height: 80)
                .foregroundColor(Color.clear)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: .black, radius: 10)
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    HStack {
                        Text("\(L10n.total.localizedString):")
                            .font(Font.title2.bold())
                        Text(store.state.shop.shop.totalExpenses().cleanValue)
                            .foregroundColor(.red)
                            .font(Font.title2.bold())
                            .padding(.trailing, 20)
                    }
                    HStack {
                        Text(L10n.balance.localized)
                            .font(Font.title2.bold())
                        Text(store.state.shop.shop.runningBalance().cleanValue)
                            .foregroundColor(store.state.shop.shop.runningBalance() < 0 ? .red : .green)
                            .font(Font.title2.bold())
                            .padding(.trailing, 20)
                    }
                }

            }
        }
        .clipped()
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
