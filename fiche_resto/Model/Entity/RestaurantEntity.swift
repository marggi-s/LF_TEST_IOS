//
//  RestaurantEntity.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import RealmSwift

class RestaurantEntity: AbstractEntity {
    
    // MARK: - Field
    dynamic var name: String? = nil
    dynamic var address: String? = nil
    dynamic var city: String? = nil
    dynamic var zipcode: String? = nil
    dynamic var picsMain: String? = nil
    var avgRate = RealmOptional<Double>()
    var rateCount = RealmOptional<Int>()
    var cardPrice = RealmOptional<Double>()
    var gpsLat = RealmOptional<Double>()
    var gpsLong = RealmOptional<Double>()
}
