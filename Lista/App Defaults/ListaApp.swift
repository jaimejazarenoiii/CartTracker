//
//  ListaApp.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import SwiftUI

@main
struct ListaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let store = AppStore(initialState: .init(), reducer: appReducer, environment: World())

    var body: some Scene {
        WindowGroup {
            ShopListView()
                .environmentObject(store)
        }
    }
}
