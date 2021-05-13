//
//  Shop.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct Shop: Codable, Identifiable {
    var id: String
    var name: String
    var items: [Item]
    var date: Date = Date()

    init(id: String = UUID().uuidString, name: String, items: [Item] = [], date: Date = Date()) {
        self.id = id
        self.name = name
        self.items = items
        self.date = date
    }
}
