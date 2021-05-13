//
//  ItemReducer.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation
import Combine

func itemReducer(state: inout ItemState,
                    action: ItemAction,
                    environment: World) -> AnyPublisher<ItemAction, Never>{
    switch action {
    case .add(let item):
        state.items.append(item)
    case .edit(let item):
        if let itemIndex = state.items.enumerated()
            .first(where: { $0.element.id == item.id })?
            .offset {
            state.items[itemIndex] = item
        }
    case .delete(let index):
        state.items.remove(at: index)
    }

    return Empty().eraseToAnyPublisher()
}
