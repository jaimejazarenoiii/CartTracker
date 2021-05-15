//
//  ItemRow.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    var body: some View {
        HStack {
            ItemRowCell(title: item.name)
            ItemRowCell(title: String(item.quantity))
            ItemRowCell(title: String(item.price))
            ItemRowCell(title: "-\(String(format: "%.2f", item.total()))")
                .foregroundColor(.red)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item(name: "", quantity: 0.0, price: 0.0))
    }
}


private struct ItemRowCell: View {
    var title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .multilineTextAlignment(.leading)
    }
}
