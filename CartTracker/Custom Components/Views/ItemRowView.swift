//
//  ItemRowView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import SwiftUI

struct ItemRowView: View {
    var item: Item
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(item.name)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            VStack(alignment: .center) {
                Text("Quantity")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(item.quantity.cleanValue)
            }
            VStack(alignment: .center) {
                Text("Price")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(item.price.cleanValue)
            }
            VStack(alignment: .center) {
                Text("Total")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(item.total().cleanValue)
            }
        }
        .padding()

    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item(name: "", quantity: 0.0, price: 0.0))
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

private struct ItemRowCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowCell(title: "")
    }
}
