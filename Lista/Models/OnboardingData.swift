//
//  OnboardingData.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/29/21.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0,
                       backgroundImage: Assets.Images.firstBackgroundImage.name,
                       primaryText: L10n.firstOnboardingTitle.localizedString,
                       secondaryText: L10n.firstOnboardingDescription.localizedString),
        OnboardingData(id: 1,
                       backgroundImage: Assets.Images.secondBackgroundImage.name,
                       primaryText: String(L10n.secondOnboardingTitle.localizedString),
                       secondaryText: L10n.secondOnboardingDescription.localizedString),
        OnboardingData(id: 2,
                       backgroundImage: Assets.Images.thirdBackgroundImage.name,
                       primaryText: L10n.thirdOnboardingTitle.localizedString,
                       secondaryText: L10n.thirdOnboardingDescription.localizedString)
    ]
}
