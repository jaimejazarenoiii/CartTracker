//
//  String+Wordify.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/10/21.
//

import Foundation

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1))
            }
            else {
                return $0 + String($1)
            }
        }
    }
}
