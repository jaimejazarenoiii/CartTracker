//
//  ShopObject.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/13/21.
//

import Foundation
import RealmSwift

class ShopObject: Object {
    @objc dynamic var id = UUID().hashValue
    @objc dynamic var name: String = ""
    var items = List<ItemObject>()
    @objc dynamic var budgetAmount: Double = 0
    @objc dynamic var date: Date = Date()
    @objc dynamic var status: Int = 1
    
    override static func primaryKey() -> String? {
        "id"
    }
}
