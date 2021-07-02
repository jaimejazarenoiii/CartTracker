//
//  Assets.swift
//  Lista
//
//  Created by Jaime Jazareno III on 7/2/21.
//

import Foundation

enum Assets {
    enum Images: String {
        case store
        case emptyShopListImage
        case firstBackgroundImage
        case secondBackgroundImage
        case thirdBackgroundImage

        var name: String {
            rawValue.firstCapitalized
        }
    }
}
