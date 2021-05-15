//
//  ItemService.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import RealmSwift

struct ItemService {
    func delete(item: Item) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(item.managedObject())
            }
        } catch let error {
          print(error.localizedDescription)
        }
    }
}
