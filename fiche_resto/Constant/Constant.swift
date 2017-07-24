//
//  Constant.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

/**
 * URL API
 */
struct UrlApp {
    
    static let baseUrl = "https://api.lafourchette.com/api"
}

/**
 * CollectionCell
 */
struct CollectionCell {
    
    struct ReusableIdentifier {

        // MARK: - Restaurant
        struct Restaurant {
            
            static let diaporamaCell = "DiaporamaCellReuseIdentifier"
            static let informationCell = "InformationCellReuseIdentifier"
            static let mapCell = "MapCellReuseIdentifier"
            static let sampleCell = "MapCellReuseIdentifier"
        }
    }
}

/**
 * Notification
 */
struct NotificationName {

    struct RestaurantDetails {
        static let loadRestaurantDetailsResult: String = "loadRestaurantDetailsResult"
    }
}
