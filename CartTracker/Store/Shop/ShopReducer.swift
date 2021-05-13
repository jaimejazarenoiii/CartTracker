//
//  ShopReducer.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation
import Combine

func shopReducer(state: inout ShopState,
                    action: ShopAction,
                    environment: World) -> AnyPublisher<ShopAction, Never>{
    switch action {
    case .add(let shop):
        state.shops.append(shop)
    case .edit(let shop):
        if let shopIndex = state.shops.enumerated()
            .first(where: { $0.element.id == shop.id })?
            .offset {
            state.shops[shopIndex] = shop
        }
    case .delete(let index):
        state.shops.remove(at: index)
    }

    return Empty().eraseToAnyPublisher()
}
