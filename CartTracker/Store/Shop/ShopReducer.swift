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
                    environment: World) -> AnyPublisher<ShopAction, Never> {
    switch action {
    case .getAll:
        state.shops = environment.shopService.all().sortedByDate()
    case .add(let shop):
        environment.shopService.add(shop: shop)
        state.shops = environment.shopService.all().sortedByDate()
    case .set(let shop):
        state.shops = environment.shopService.all().sortedByDate()
        if let cachedShop = environment.shopService.findShop(shop.id) {
            state.shop = cachedShop
        }
    case .edit(let id, let name, let budgetAmount):
        environment.shopService.update(id: id, name: name, budgetAmount: budgetAmount)
        state.shops = environment.shopService.all().sortedByDate()
        if let cachedShop = environment.shopService.findShop(id) {
            state.shop = cachedShop
        }
    case .update(let status, let shop):
        environment.shopService.update(status: status, shop: shop)
        state.shops = environment.shopService.all().sortedByDate()
        if let cachedShop = environment.shopService.findShop(shop.id) {
            state.shop = cachedShop
        }
    case .delete(let shop):
        environment.shopService.delete(shop: shop)
        state.shops = environment.shopService.all().sortedByDate()
    }

    return Empty().eraseToAnyPublisher()
}
