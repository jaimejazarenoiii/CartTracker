//
//  NewShopView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/14/21.
//

import Foundation
import SwiftUI

struct NewShopView: View {
    @Binding var name: String
    @Binding var budget: Double

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Budget", value: $budget, formatter: NumberFormatter())
        }
    }
}

struct NewShopView_Previews: PreviewProvider {
    static var previews: some View {
        NewShopView(name: .constant(""), budget: .constant(0.0))
    }
}
