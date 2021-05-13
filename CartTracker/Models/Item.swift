//
//  Item.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: String
    var quantity: Double
    var price: Double
    lazy var total: Double = {
        quantity * price
    }()

    init(id: String, quantity: Double, price: Double) {
        self.id = id
        self.quantity = quantity
        self.price = price
    }
}
