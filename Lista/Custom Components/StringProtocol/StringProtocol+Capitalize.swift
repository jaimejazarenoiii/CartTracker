//
//  StringProtocol+Capitalize.swift
//  Lista
//
//  Created by Jaime Jazareno III on 7/2/21.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
