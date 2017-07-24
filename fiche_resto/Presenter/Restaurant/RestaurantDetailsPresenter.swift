//
//  RestaurantDetailPresenter.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class RestaurantDetailsPresenter: AbstractPresenter<RestaurantDetailsViewContract> {
    
    var RestaurantDetailsVo: RestaurantDetailsVo?
    
    // MARK: - Inherit
    override func registerNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(RestaurantDetailsPresenter.loadRestaurantDetailsResult(_:)), name: NotificationName.RestaurantDetails.loadRestaurantDetailsResult)
    }
    
     // MARK: - Notification
    func loadRestaurantDetailsResult(_ notification: Notification) {
        
        guard let result = notification.object as? RestaurantEntity else {
            
            self.delegate?.displayError(error: notification.object as! String)
            return
        }
        
        guard let restaurantDetailsVo: RestaurantDetailsVo = RestaurantConverter.entityToVo(entity: result) else {
            
            self.delegate?.displayError(error: "common.error")
            return
        }
        
        self.delegate?.displayRestaurantDetails(restaurantDetailsVo: restaurantDetailsVo)
    }
}

// MARK: - RestaurantDetailPresenterContract
extension RestaurantDetailsPresenter: RestaurantDetailsPresenterContract {
    
    func loadRestaurantDetails() {
        let restaurantController = RestaurantController()
        
        restaurantController.loadRestaurant()
    }
}
