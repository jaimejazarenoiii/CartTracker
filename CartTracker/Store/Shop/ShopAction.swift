//
//  ShopAction.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum ShopAction {
    case getAll
    case add(shop: Shop)
    case set(shop: Shop)
    case addItem(_ item: Item, to: Shop)
    case removeItem(_ item: Item, from: Shop)
    case edit(shop: Shop)
    case delete(shop: Shop)
}
