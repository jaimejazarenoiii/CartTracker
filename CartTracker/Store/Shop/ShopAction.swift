//
//  ShopAction.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum ShopAction {
    case getAll
    case set(shop: Shop)
    case add(shop: Shop)
    case edit(id: Int, name: String, budgetAmount: Double)
    case delete(shop: Shop)
    case update(status: ShopSessionStatus, shop: Shop)
}
