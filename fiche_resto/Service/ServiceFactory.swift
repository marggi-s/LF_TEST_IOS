//
//  ServiceFactory.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class ServiceFactory {

    static func getRestaurantService() -> RestaurantServiceProtocol {
        #if MOCK
            return RestaurantServiceMock()
        #else
            return RestaurantService()
        #endif
    }
}
