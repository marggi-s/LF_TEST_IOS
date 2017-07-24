//
//  RestaurantDetailsDiaporamaCollectionViewCell.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Stevia

protocol RestaurantDetailsDiaporamaCollectionViewCellDelegate: class {
    
    func RestaurantDetailsDiaporamaCollectionViewCellDidTapOnShowMorePictures(_ cell: RestaurantDetailsDiaporamaCollectionViewCell)
}

class RestaurantDetailsDiaporamaCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Attributes
    let photo = UIImageView()
    let icon = UIImageView()
    
    weak var delegate: RestaurantDetailsDiaporamaCollectionViewCellDelegate? = nil
    
    // MARK: - Inherit
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        sv(self.photo,
           self.icon
        )
        
        layout(
            0,
            |-0-self.photo-0-|,
            0,
            |-0-self.icon-|,
            0
        )
        
        self.icon.image = #imageLiteral(resourceName: "diaporama")
        self.photo.contentMode = .scaleAspectFill
        self.icon.contentMode = .scaleAspectFit
        self.photo.backgroundColor = .lightGray
    }
    
    // MARK: Actions
    func didTapOnImage() {
        
        self.delegate?.RestaurantDetailsDiaporamaCollectionViewCellDidTapOnShowMorePictures(self)
    }
}
