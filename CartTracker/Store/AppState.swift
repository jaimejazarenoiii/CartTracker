//
//  AppState.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct AppState {
    var shop: ShopState
    var item: ItemState

    init() {
        self.shop = ShopState(shops: [], shop: Shop(id: "", name: "", items: [], date: Date()))
        self.item = ItemState(items: [], item: Item(id: "", quantity: 0, price: 0))
    }
}
