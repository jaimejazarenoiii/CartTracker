//
//  ShopService.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import RealmSwift

struct ShopService {
    func all() -> [Shop] {
        do {
            let realm = try Realm()
            
            return realm.objects(ShopObject.self).map { Shop(managedObject: $0) }
        } catch let error {
            // Handle error
            print(error.localizedDescription)
        }
        return []
    }
    
    func findShop(_ id: Int) -> Shop? {
        do {
            let realm = try Realm()
            
            return realm.objects(ShopObject.self).first(where: { $0.id == id }).map { Shop(managedObject: $0) }
        } catch let error {
            // Handle error
            print(error.localizedDescription)
        }
        return nil
    }
    
    func add(shop: Shop) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(shop.managedObject())
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func addItems(_ item: Item, to: Shop) {
        do {
            let realm = try Realm()
            var tmpShop = to
            tmpShop.items.append(item)
            try realm.write {
                realm.add(tmpShop.managedObject(), update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(shop: Shop) {
        do {
            let realm = try Realm()
            try realm.write {
                if let cachedShop = realm.objects(ShopObject.self).last(where: { $0.id == shop.id }) {
                    realm.delete(cachedShop)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func removeItem(_ item: Item, from: Shop) {
        do {
            let realm = try Realm()
            var tmpShop = from
            tmpShop.items.removeAll(where: { $0.id == item.id })
            try realm.write {
                realm.add(tmpShop.managedObject(), update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
