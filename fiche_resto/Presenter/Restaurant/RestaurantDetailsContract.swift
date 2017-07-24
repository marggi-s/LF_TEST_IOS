//
//  RestaurantDetailContract.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

protocol RestaurantDetailsPresenterContract: AbstractPresenterContract {
    func loadRestaurantDetails()
}

protocol RestaurantDetailsViewContract: AbstractViewContract {
    
    func displayRestaurantDetails(restaurantDetailsVo: RestaurantDetailsVo?)
    func displayError(error: String)
}
