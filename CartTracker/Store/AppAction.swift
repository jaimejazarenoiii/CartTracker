//
//  AppAction.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

enum AppAction {
    case shop(action: ShopAction)
    case item(action: ItemAction)
}
