//
//  RestaurantDetailsVo.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class RestaurantDetailsVo: NSObject {
    
    var idRestaurant: Int? = 0
    
    var name: String? = nil
    var address: String? = nil
    var city: String? = nil
    var zipcode: String? = nil
    var avgRate: Double? = 0.0
    var rateCount: Int = 0
    var cardPrice: Double? = 0.0
    var gpsLat: Double? = 0.0
    var gpsLong: Double? = 0.0
    var picsMain: String? = nil
}
