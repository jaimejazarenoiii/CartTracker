//
//  L10n.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import Foundation
import SwiftUI

enum L10n: String {
    case addProduct
    case appName
    case balance
    case budget
    case editShoppingSessionDetails
    case firstOnboardingDescription
    case firstOnboardingTitle
    case price
    case runningBill
    case secondOnboardingDescription
    case secondOnboardingTitle
    case shoppingSessions
    case spent
    case total
    case quantity
    case thirdOnboardingDescription
    case thirdOnboardingTitle

    var localized: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }

    var localizedString: String {
        NSLocalizedString(rawValue, comment: "")
    }

    var title: String {
        rawValue.camelCaseToWords()
    }
}
