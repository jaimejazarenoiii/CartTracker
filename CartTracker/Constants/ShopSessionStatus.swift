//
//  ShopSessionStatus.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import SwiftUI

enum ShopSessionStatus: Int, Codable {
    case active, inactive

    var color: Color {
        switch self {
        case .active: return .green
        case .inactive: return .red
        }
    }

    var title: String {
        String(reflecting: self).camelCaseToWords()
    }

    var option: String {
        switch self {
        case .active: return "inactive"
        case .inactive: return "active"
        }
    }
}
