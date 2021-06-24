//
//  ItemAction.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum ItemAction {
    case all(from: Shop)
    case add(_ item: Item, to: Shop)
    case edit(id: Int,
              name: String,
              quantity: Double,
              price: Double,
              shopId: Int)
    case delete(item: Item, from: Shop)
}
