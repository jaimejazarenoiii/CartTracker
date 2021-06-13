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
    case .all(let shop):
        state.items = environment.itemService.fetchWith(shopId: shop.id)
    case .add(let item, let shop):
        environment.itemService.addItem(item, to: shop)
        state.items = environment.itemService.fetchWith(shopId: shop.id)
    case .edit(let id, let name, let quantity, let price, let shopId):
        environment.itemService.update(id: id,
                                       name: name,
                                       quantity: quantity,
                                       price: price)
        state.items = environment.itemService.fetchWith(shopId: shopId)
    case .delete(let item, let shop):
        environment.itemService.delete(item: item)
        state.items = environment.itemService.fetchWith(shopId: shop.id)
    }

    return Empty().eraseToAnyPublisher()
}
