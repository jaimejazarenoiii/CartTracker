//
//  Persistable.swift
//  CartTracker
//
//  Created by Jaime Jazareno III on 5/15/21.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
