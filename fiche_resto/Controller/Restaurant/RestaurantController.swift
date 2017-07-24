//
//  RestaurantController.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class RestaurantController: AbstractController {
    
    func loadRestaurant(restaurantId: Int = 6861) {
        let service = ServiceFactory.getRestaurantService()
        let restaurantDAO = RestaurantDAO()
        
        restaurantDAO.getRestaurant(id: restaurantId, completion: { (restaurantEntityLocal: RestaurantEntity?, error: String?) in
            
            guard error == nil else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.RestaurantDetails.loadRestaurantDetailsResult), object: error)
                return
            }
            if restaurantEntityLocal != nil {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.RestaurantDetails.loadRestaurantDetailsResult), object: restaurantEntityLocal)
            }
            
            service.getRestaurantDetails(restaurantId: restaurantId, completion: { (restaurantEntity : RestaurantEntity?, error: String?) in
                if error != nil {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.RestaurantDetails.loadRestaurantDetailsResult), object: error)
                } else {
                    restaurantDAO.putRestaurant(restaurantEntity: restaurantEntity!, completion: { _ in
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.RestaurantDetails.loadRestaurantDetailsResult), object: restaurantEntity)
                    })
                }
            })
        })
    }
}
