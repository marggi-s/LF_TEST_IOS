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
    
    static let baseUrl: String = "https://api.lafourchette.com/api"
}

/**
 * CollectionCell
 */
struct CollectionCell {
    
    struct ReusableIdentifier {

        // MARK: - Restaurant
        struct Restaurant {
            
            static let diaporamaCell: String = "DiaporamaCellReuseIdentifier"
            static let informationCell: String = "InformationCellReuseIdentifier"
            static let mapCell: String = "MapCellReuseIdentifier"
            static let sampleCell: String = "SampleCellReuseIdentifier"
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

/**
 * ParisLocation
 */
struct ParisLocation {
    static let latitude: Double = 48.8566
    static let longitude: Double = 2.3522
}


