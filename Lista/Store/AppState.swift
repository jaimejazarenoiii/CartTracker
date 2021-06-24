//
//  AppState.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct AppState {
    var shop: ShopState
    var item: ItemState

    init() {
        self.shop = ShopState(shops: [], shop: Shop(name: "", items: [], date: Date()))
        self.item = ItemState(items: [], item: Item(id: 0, name: "", quantity: 0, price: 0))
    }
}
