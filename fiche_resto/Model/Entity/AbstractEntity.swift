//
//  AbstractEntity.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import RealmSwift

class AbstractEntity: Object {
    
    var id = RealmOptional<Int>()
    
    override class func primaryKey() -> String {
        return "id"
    }
}


