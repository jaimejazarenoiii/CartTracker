//
//  EmptyListView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 7/2/21.
//

import SwiftUI

struct EmptyListView: View {
    var text: String = ""
    var body: some View {
        ZStack(alignment: .center) {
            Image(Assets.Images.emptyShopListImage.name)
                .resizable()
                .scaledToFit()
                .opacity(0.7)
            Text(text)
                .font(.largeTitle)
                .shadow(color: Color.primary, radius: 0.5)
                .lineLimit(3)
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(text: "")
    }
}
