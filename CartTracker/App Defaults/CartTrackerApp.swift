//
//  CartTrackerApp.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import SwiftUI

@main
struct CartTrackerApp: App {
    let store = AppStore(initialState: .init(), reducer: appReducer, environment: World())

    var body: some Scene {
        WindowGroup {
            ShopListView()
                .environmentObject(store)
        }
    }
}
