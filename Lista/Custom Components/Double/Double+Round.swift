//
//  Double+Round.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/17/21.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }

    var cleanValue: String {
        remainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
