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
    case .getAll:
        state.shops = environment.shopService.all().sortedByDate()
    case .add(let shop):
        environment.shopService.add(shop: shop)
        state.shops = environment.shopService.all().sortedByDate()
    case .set(let shop):
        state.shop = shop
    case .addItem(let item, let shop):
        if let shopIndex = state.shops.enumerated()
            .first(where: { $0.element.id == shop.id })?
            .offset {
            environment.shopService.addItems(item, to: shop)
            if let cachedShop = environment.shopService.findShop(shop.id) {
                state.shops[shopIndex] = cachedShop
                state.shop = cachedShop
            }
        }
    case .removeItem(let item, let shop):
        if let shopIndex = state.shops.enumerated()
            .first(where: { $0.element.id == shop.id })?
            .offset {
            environment.shopService.removeItem(item, from: shop)
            if let cachedShop = environment.shopService.findShop(shop.id) {
                state.shops[shopIndex] = cachedShop
                state.shop = cachedShop
            }
        }
    case .edit(let shop):
        if let shopIndex = state.shops.enumerated()
            .first(where: { $0.element.id == shop.id })?
            .offset {
            state.shops[shopIndex] = shop
        }
    case .delete(let shop):
        environment.shopService.delete(shop: shop)
        state.shops = environment.shopService.all().sortedByDate()
    }

    return Empty().eraseToAnyPublisher()
}
