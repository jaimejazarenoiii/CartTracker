//
//  ShopRowView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import SwiftUI

struct ShopRowView: View {
    @State private var statusOpacity = 1.0
    @State private var pulseAnimation: Animation = .default

    var shop: Shop
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    var body: some View {
        ZStack(alignment: .topLeading) {
            Circle()
                .foregroundColor(shop.status.color)
                .frame(width: 10, height: 10)
                .offset(x: 10, y: 8)
                .opacity(statusOpacity)
                .animation(pulseAnimation)
                .onAppear {
                    statusOpacity = shop.status == .active ?  0.3 : 1.0
                    pulseAnimation = shop.status == .active ? Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true) : .default
                }
                .onDisappear {
                    statusOpacity = 1.0
                    pulseAnimation = .default
                }
            Image(Assets.Images.store.name)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .scaleEffect(2)
                .rotationEffect(.degrees(30))
                .foregroundColor(Color.green)
                .position(x: 45, y: 70)
                .opacity(0.6)
                .clipped()
            HStack {
                VStack(alignment: .leading) {
                    Text(shop.name)
                        .font(.largeTitle)
                        .shadow(radius: 5)
                        .lineLimit(3)
                    Text(formatter.string(from: shop.date))
                        .font(.caption)
                        .padding(.bottom, 20)
                        .shadow(radius: 5)
                }
                .padding([.top, .leading], 20)
                Spacer()
                VStack(alignment: .trailing) {
                    Spacer()
                    Text(L10n.budget.localized)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(String(shop.budgetAmount))
                        .multilineTextAlignment(.trailing)
                    Spacer()
                    Text(L10n.spent.localized)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(String(shop.totalExpenses()))
                        .multilineTextAlignment(.trailing)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct ShopRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopRowView(shop: Shop(name: "Colonade", budgetAmount: 0))
    }
}
