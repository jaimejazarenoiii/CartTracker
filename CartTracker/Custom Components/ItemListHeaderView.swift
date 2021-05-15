//
//  ItemListHeaderView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ItemListHeaderView: View {
    var body: some View {
        HStack {
            ItemListHeaderCellView(title: "Item name")
            ItemListHeaderCellView(title: "Qty")
            ItemListHeaderCellView(title: "Price")
            ItemListHeaderCellView(title: "Total")
        }
    }
}

private struct ItemListHeaderCellView: View {
    var title: String

    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .multilineTextAlignment(.leading)
    }
    
}

struct ItemListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListHeaderView()
    }
}
