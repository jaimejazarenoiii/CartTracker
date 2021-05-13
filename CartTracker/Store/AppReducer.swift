//
//  AppReducer.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation
import Combine

func appReducer(state: inout AppState,
                action: AppAction,
                environment: World) -> AnyPublisher<AppAction, Never> {
    switch action {
    case let .shop(action):
        return shopReducer(state: &state.shop,
                           action: action,
                           environment: environment)
            .map(AppAction.shop)
            .eraseToAnyPublisher()
    case let .item(action):
        return itemReducer(state: &state.item,
                           action: action,
                           environment: environment)
            .map(AppAction.item)
            .eraseToAnyPublisher()
    }
}
