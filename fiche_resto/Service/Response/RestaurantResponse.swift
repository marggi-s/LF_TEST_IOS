//
//  RestaurantResponse.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

class RestaurantResponse: Mappable {
    
    // MARK: - PK
    var idRestaurant: Int? = nil
    
    // MARK: - Field
    var name: String? = nil
    var address: String? = nil
    var city: String? = nil
    var zipcode: String? = nil
    var avgRate: Double? = nil
    var rateCount: Int? = nil
    var cardPrice: Double? = nil
    var gpsLat: Double? = nil
    var gpsLong: Double? = nil
    var picsMain : [String : String] = [:]
    
    // MARK: - mappable
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.idRestaurant <- map["id_restaurant"]
        self.name <- map["name"]
        self.address <- map["address"]
        self.city <- map["city"]
        self.zipcode <- map["zipcode"]
        self.avgRate <- map["avg_rate"]
        self.rateCount <- map["rate_count"]
        self.cardPrice <- map["card_price"]
        self.gpsLat <- map["gps_lat"]
        self.gpsLong <- map["gps_long"]
        self.picsMain <- map["pics_main"]
    }
}
