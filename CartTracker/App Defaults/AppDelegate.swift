//
//  AppDelegate.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 6/8/21.
//

import UIKit
import RealmSwift

final class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        configRealm()
        if CommandLine.arguments.contains("testing") {
            // clear your app state before running UI tests here.
            UIView.setAnimationsEnabled(false)
        }
    }

    private func configRealm() {
        let config = Realm.Configuration(readOnly: false, deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
    }
}
