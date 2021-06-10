//
//  LocalizedString.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import Foundation
import SwiftUI

enum LocalizedString: String {
    case appName
    case budget
    case runningBill
    case shoppingSessions

    var localized: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }

    var title: String {
        rawValue.camelCaseToWords()
    }
}
