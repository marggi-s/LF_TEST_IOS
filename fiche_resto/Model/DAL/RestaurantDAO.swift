//
//  RestaurantDAO.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class RestaurantDAO {
    
    func putRestaurant(restaurantEntity: RestaurantEntity, completion: (String?) -> Void) {
        
        DAL.insertOrUpdateEntity(entity: restaurantEntity)
        completion(nil)
    }
    
    func getRestaurant(id: Int = 6861, completion: (RestaurantEntity?, String?) -> Void) {
        
        let predicateRestaurant = NSPredicate(format: "id == %@", NSNumber(value: id))
        
        let restaurantEntity = DAL.readEntity(classType: RestaurantEntity.self, predicate: predicateRestaurant)
        completion(restaurantEntity as? RestaurantEntity, nil)
    }
}
