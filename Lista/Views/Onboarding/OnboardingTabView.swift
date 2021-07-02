//
//  OnboardingTabView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/29/21.
//

import Foundation
import SwiftUI

struct OnboardingTabView: View {
    @State private var currentTab = 0
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
                    ForEach(OnboardingData.list) { viewData in
                        OnboardingView(data: viewData)
                            .tag(viewData.id)
                    }
                })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView()
    }
}
