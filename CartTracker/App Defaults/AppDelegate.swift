//
//  AppDelegate.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 6/8/21.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        if CommandLine.arguments.contains("testing") {
            // clear your app state before running UI tests here.
            UIView.setAnimationsEnabled(false)
        }
    }
}
