//
//  Item.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: Int
    var name: String
    var quantity: Double
    var price: Double

    init(id: Int = UUID().hashValue,
         name: String,
         quantity: Double,
         price: Double) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.price = price
    }
    
    func total() -> Double {
        quantity * price
    }
}

extension Item: Persistable {
    init(managedObject: ItemObject) {
        id = managedObject.id
        name = managedObject.name
        quantity = managedObject.quantity
        price = managedObject.price
    }

    func managedObject() -> ItemObject {
        let item = ItemObject()
        item.id = id
        item.name = name
        item.quantity = quantity
        item.price = price
        return item
    }
}
