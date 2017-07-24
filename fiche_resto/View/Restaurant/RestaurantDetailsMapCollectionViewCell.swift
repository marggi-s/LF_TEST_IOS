//
//  RestaurantDetailsMapCollectionViewCell.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Stevia
import MapKit

protocol RestaurantDetailsMapCollectionViewCellDelegate: class {
    
}

class RestaurantDetailsMapCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Attributes
    let mapView = MKMapView()
    
    // MARK: - Inherit
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        sv(self.mapView)
        
        layout(
            0,
            |-0-self.mapView-0-|,
            0)
    }
    
    func setMapLocation(restaurantDetailsVo: RestaurantDetailsVo) {
        
        let initialLocation = CLLocation(latitude: restaurantDetailsVo.gpsLat ?? ParisLocation.latitude, longitude: restaurantDetailsVo.gpsLong ?? ParisLocation.longitude)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
