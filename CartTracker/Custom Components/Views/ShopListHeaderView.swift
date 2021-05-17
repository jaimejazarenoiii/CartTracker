//
//  ShopListHeaderView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ShopListHeaderView: View {
    var body: some View {
        HStack {
            Text("Shop Name")
            Spacer()
            Text("Budget")
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 5)
            Text("Total")
                .multilineTextAlignment(.leading)
                .padding(.trailing, 5)
        }
        .padding(.vertical, 8)
    }
}

struct ShopListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListHeaderView()
    }
}
