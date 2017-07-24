//
//  DAL.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import RealmSwift

class DAL {
    
    static func writeTransaction(transaction: () -> Void) {
        
        // Get context and execute transaction
        let realm: Realm = try! Realm()
        try! realm.write {
            transaction()
        }
    }
    
    static func readEntity(id: Int = 6861,  classType: AbstractEntity.Type, predicate: NSPredicate) -> AbstractEntity? {
        
        let realm: Realm = try! Realm()
        let result = realm.objects(classType).filter(predicate)
        
        return result.first
    }
    
    static func insertOrUpdateEntity(entity: AbstractEntity) {
        
        if entity.id.value != nil {
            let realm: Realm = try! Realm()
            try! realm.write {
                realm.add(entity, update: true)
            }
        }
    }
    
    static func deleteEntity(entity: AbstractEntity) {
        if entity.id.value != nil {
            let realm: Realm = try! Realm()
            try! realm.write {
                realm.delete(entity)
            }
        }
    }
    
    static func clearDatabase() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
