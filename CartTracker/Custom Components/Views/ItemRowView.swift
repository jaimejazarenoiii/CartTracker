//
//  ItemRowView.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import SwiftUI

struct ItemRowView: View {
    @EnvironmentObject var store: AppStore
    var item: Item
    @State var showDialog: ItemListView.ActiveSheet?

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
            VStack(alignment: .trailing) {
                Image(symbol: .pencilCircle)
                    .foregroundColor(Color.blue)
                    .offset(x: 5, y: -15)
                    .onTapGesture { // workaround for adding button in list
                        showDialog = .edit
                    }
            }
        }
        .padding()
        .sheet(item: $showDialog) { dialogItem in
            if dialogItem == .edit {
                ItemFormView(showDialog: $showDialog,
                             name: item.name,
                             quantity: String(item.quantity),
                             price: String(item.price),
                             procedure: .edit,
                             id: item.id,
                             shop: store.state.shop.shop)
            }
        }
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
