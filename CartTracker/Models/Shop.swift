//
//  Shop.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation

struct Shop: Codable, Identifiable {
    var id: Int
    var name: String
    var items: [Item]
    var budgetAmount: Double
    var date: Date = Date()
    var status: ShopSessionStatus

    init(id: Int = UUID().hashValue,
         name: String,
         items: [Item] = [],
         budgetAmount: Double = 0.0,
         date: Date = Date(),
         status: ShopSessionStatus = .active) {
        self.id = id
        self.name = name
        self.items = items
        self.budgetAmount = budgetAmount
        self.date = date
        self.status = status
    }

    func totalExpenses() -> Double {
        items.map { $0.quantity * $0.price }.reduce(0, +)
    }

    func runningBalance() -> Double {
        let runningBalance = budgetAmount - totalExpenses()
        return runningBalance.rounded(toPlaces: 2)
    }
}

extension Shop: Persistable {
    init(managedObject: ShopObject) {
        id = managedObject.id
        name = managedObject.name
        budgetAmount = managedObject.budgetAmount
        items = managedObject.items.map { Item(managedObject: $0) }
        date = managedObject.date
        status = ShopSessionStatus(rawValue: managedObject.status) ?? .active
    }
    func managedObject() -> ShopObject {
        let shop = ShopObject()
        shop.id = id
        shop.name = name
        shop.budgetAmount = budgetAmount
        shop.date = date
        shop.status = status.rawValue
        shop.items.append(objectsIn: items.map { $0.managedObject() })
        return shop
    }
}

extension Array where Element == Shop {
    func sortedByDate() -> [Shop] {
        sorted(by: { $0.date > $1.date })
    }
}
