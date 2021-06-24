//
//  ItemObject.swift
//  Lista
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import RealmSwift

class ItemObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var quantity: Double = 0
    @objc dynamic var price: Double = 0
    
    override static func primaryKey() -> String? {
        "id"
    }
}


