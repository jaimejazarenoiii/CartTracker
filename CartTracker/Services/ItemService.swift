//
//  ItemService.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import RealmSwift

struct ItemService {
    func fetchWith(shopId: Int) -> [Item] {
        guard let realm = try? Realm(),
              let cachedShop = realm.objects(ShopObject.self).first(where: { $0.id == shopId }) else { return [] }
        return cachedShop.items.map { Item(managedObject: $0) }
    }

    func addItem(_ item: Item, to: Shop) {
        do {
            let realm = try Realm()
            guard let cachedShop = realm.objects(ShopObject.self).first(where: { $0.id == to.id }) else { return }
            try realm.write {
                cachedShop.items.append(item.managedObject())
                realm.add(cachedShop, update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func delete(item: Item) {
        do {
            let realm = try Realm()
            try realm.write {
                if let cachedItem = realm.objects(ItemObject.self).last(where: { $0.id == item.id }) {
                    realm.delete(cachedItem)
                }
            }
        } catch let error {
          print(error.localizedDescription)
        }
    }

    func update(id: Int,
                name: String,
                quantity: Double,
                price: Double) {
        do {
            let realm = try Realm()
            guard let cachedItem = realm.objects(ItemObject.self)
                    .first(where: { $0.id == id } ) else { return }
            try realm.write {
                cachedItem.name = name
                cachedItem.quantity = quantity
                cachedItem.price = price
                realm.add(cachedItem, update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
