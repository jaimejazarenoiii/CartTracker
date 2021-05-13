//
//  ShopAction.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum ShopAction {
    case add(shop: Shop)
    case edit(shop: Shop)
    case delete(index: Int)
}
