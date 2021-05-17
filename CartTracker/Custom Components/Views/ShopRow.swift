//
//  ShopRow.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ShopRow: View {
    var shop: Shop
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(shop.name)
                Text(formatter.string(from: shop.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(String(shop.budgetAmount))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 5)
            Text(String(shop.totalExpenses()))
                .multilineTextAlignment(.leading)
                .padding(.trailing, 5)
        }
    }
}

struct ShopRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopRow(shop: Shop(name: "", budgetAmount: 0))
    }
}
