//
//  ItemAction.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum ItemAction {
    case add(item: Item)
    case edit(item: Item)
    case delete(index: Int)
}
