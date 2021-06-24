//
//  View+CornerRadius.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self,
                        modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
