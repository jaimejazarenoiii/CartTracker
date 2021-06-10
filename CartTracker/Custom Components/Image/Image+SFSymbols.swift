//
//  Image+SFSymbols.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import SwiftUI

extension Image {
    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
