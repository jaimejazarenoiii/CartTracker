//
//  TextAlert.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation
import UIKit

struct TextAlert {
    var title: String // Title of the dialog
    var message: String // Dialog message
    var placeholder: String = "" // Placeholder text for the TextField
    var accept: String = "OK" // The left-most button label
    var cancel: String? = "Cancel" // The optional cancel (right-most) button label
    var secondaryActionTitle: String? = nil // The optional center button label
    var keyboardType: UIKeyboardType = .default // Keyboard tzpe of the TextField
    var action: (String?) -> Void // Triggers when either of the two buttons closes the dialog
    var secondaryAction: (() -> Void)? = nil // Triggers when the optional center button is tapped
}
