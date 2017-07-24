//
//  RestaurantDetailsInformationCollectionViewCell.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Stevia

protocol RestaurantDetailsInformationCollectionViewCellDelegate: class {
    
}

class RestaurantDetailsInformationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Attributes
    let title = UILabel()
    let address = UILabel()
    let avgRate = UILabel()
    let numberOfRate = UILabel()
    let avgPrice = UILabel()
    
    // MARK: - Inherit
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        sv(self.title.style(titleStyle),
           self.address.style(addressStyle),
           self.avgRate.style(avgRateStyle),
           self.numberOfRate.style(numberOfRateStyle),
           self.avgPrice.style(avgPriceStyle)
           )
        
        layout(
            0,
            |-20-self.title-|,
            5,
            |-20-self.address-|,
            10,
            |-self.avgRate-|,
            2,
            |-self.numberOfRate-|,
            20,
            |-self.avgPrice-|,
            ""
        )
    }
    
    func titleStyle(label: UILabel) {
        
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = .black
        label.textAlignment = .left
    }
    
    func addressStyle(label: UILabel) {
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textColor = .lightGray
        label.textAlignment = .left
    }
    
    func avgRateStyle(label: UILabel) {
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = .black
        label.textAlignment = .center
    }
    
    func numberOfRateStyle(label: UILabel) {
        
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.textAlignment = .center
    }
    
    func avgPriceStyle(label: UILabel) {
        
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = .black
        label.textAlignment = .center
    }
}
