//
//  LocalizedString.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import Foundation
import SwiftUI

enum LocalizedString: String {
    case appName
    case balance
    case budget
    case runningBill
    case shoppingSessions
    case spent

    var localized: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }

    var title: String {
        rawValue.camelCaseToWords()
    }
}
