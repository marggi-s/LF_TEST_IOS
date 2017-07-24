//
//  RestaurantConverter.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import RealmSwift

class RestaurantConverter {
    
    static func reponseToEntity(response: RestaurantResponse?) -> RestaurantEntity? {
        guard response != nil else {
            return nil
        }
        
        let restaurantEntity = RestaurantEntity()
        
        restaurantEntity.id = RealmOptional<Int>(response!.idRestaurant)
        restaurantEntity.name = response!.name
        restaurantEntity.address = response!.address
        restaurantEntity.city = response!.city
        restaurantEntity.zipcode = response!.zipcode
        restaurantEntity.avgRate = RealmOptional<Double>(response!.avgRate)
        restaurantEntity.rateCount = RealmOptional<Int>(response!.rateCount)
        restaurantEntity.cardPrice = RealmOptional<Double>(response!.cardPrice)
        restaurantEntity.gpsLat = RealmOptional<Double>(response!.gpsLat)
        restaurantEntity.gpsLong = RealmOptional<Double>(response!.gpsLong)
        if response!.picsMain.count > 0 {
            restaurantEntity.picsMain = response!.picsMain["480x270"]
        }
        
        return restaurantEntity
    }
    
    static func entityToVo(entity: RestaurantEntity?) -> RestaurantDetailsVo? {
        guard entity != nil else {
            return nil
        }
        
        let restaurantDetailsVo = RestaurantDetailsVo()
        
        restaurantDetailsVo.idRestaurant = entity!.id.value ?? 0
        restaurantDetailsVo.name = entity!.name
        restaurantDetailsVo.address = entity!.address
        restaurantDetailsVo.city = entity!.city
        restaurantDetailsVo.zipcode = entity!.zipcode
        restaurantDetailsVo.avgRate = entity!.avgRate.value ?? 0.0
        restaurantDetailsVo.rateCount = entity!.rateCount.value ?? 0
        restaurantDetailsVo.cardPrice = entity!.cardPrice.value ?? 0.0
        restaurantDetailsVo.gpsLat = entity!.gpsLat.value ?? 0.0
        restaurantDetailsVo.gpsLong = entity!.gpsLong.value ?? 0.0
        restaurantDetailsVo.picsMain = entity!.picsMain
        
        return restaurantDetailsVo
    }
    
}
