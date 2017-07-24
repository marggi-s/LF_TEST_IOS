//
//  RestaurantDetailsCollectionViewController.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Stevia
import AlamofireImage

class RestaurantDetailsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // MARK: - Attributes
    var presenter: RestaurantDetailsPresenter?
    var restaurantDetailVo: RestaurantDetailsVo? = nil
    
    // MARK: - Inherit
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.register(RestaurantDetailsInformationCollectionViewCell.self, forCellWithReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.informationCell)
        self.collectionView?.register(RestaurantDetailsDiaporamaCollectionViewCell.self, forCellWithReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.diaporamaCell)
        self.collectionView?.register(RestaurantDetailsMapCollectionViewCell.self, forCellWithReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.mapCell)
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.sampleCell)
        self.collectionView?.style(CollectionViewStyle)
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        
        self.presenter = RestaurantDetailsPresenter(delegate: self)
        self.presenter?.loadRestaurantDetails()
        
        self.collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Style
    func CollectionViewStyle(collectionView: UICollectionView) {
        collectionView.backgroundColor = UIColor.white
    }
    
    // MARK: - Private
    func setInformationCell(indexPath: IndexPath) -> RestaurantDetailsInformationCollectionViewCell? {
        if let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.informationCell, for: indexPath) as? RestaurantDetailsInformationCollectionViewCell {
            
            cell.title.text = self.restaurantDetailVo?.name

            cell.address.text = "\((self.restaurantDetailVo?.address ?? "")) \((describing: self.restaurantDetailVo?.zipcode ?? "")) \((self.restaurantDetailVo?.city) ?? "")"
            cell.avgRate.text = "\((self.restaurantDetailVo?.avgRate?.description ?? "NA"))/10"
            cell.numberOfRate.text = "\((self.restaurantDetailVo?.rateCount.description ?? "0")) avis LaFourchette"
            cell.avgPrice.text = "Prix moyen à la carte de ce restaurant: \((self.restaurantDetailVo?.cardPrice?.description ?? "NA"))"
            
            return cell
        }
        return nil
    }
    
    func setDiaporamaCell(indexPath: IndexPath) -> RestaurantDetailsDiaporamaCollectionViewCell? {
        if let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.diaporamaCell, for: indexPath) as? RestaurantDetailsDiaporamaCollectionViewCell {
            
            if  self.restaurantDetailVo?.picsMain != nil {
                if let url = URL(string: (self.restaurantDetailVo?.picsMain)!) {
                    cell.photo.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
                } else {
                    cell.photo.image = #imageLiteral(resourceName: "placeholder")
                }
            }
            return cell
        }
        return nil
    }
    
    func setMapCell(indexPath: IndexPath) -> RestaurantDetailsMapCollectionViewCell? {
         return nil
    }
    
}
// MARK: - UICollectionViewDataSource
extension RestaurantDetailsCollectionViewController {
    
     override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.restaurantDetailVo != nil {
            return 1
        }
        return 0
    }
    
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.restaurantDetailVo != nil {
            return 3
        }
        return 0
    }
    
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell? = nil
        
        switch indexPath.row {
        case 0:
            cell = setDiaporamaCell(indexPath: indexPath)
        case 1:
            cell = setInformationCell(indexPath: indexPath)
        case 2:
            cell = setMapCell(indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
        
        if cell != nil {
            return cell!
        }
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.ReusableIdentifier.Restaurant.sampleCell, for: indexPath)
        return cell!
    }
}

// MARK: - UICollectionViewDelegate
extension RestaurantDetailsCollectionViewController {
}

// MARK: - RestaurantDetailViewContract
extension RestaurantDetailsCollectionViewController : RestaurantDetailsViewContract {
    
    func displayError(error: String) {
        
    }
    
    func displayRestaurantDetails(restaurantDetailsVo: RestaurantDetailsVo?) {
        
        if (restaurantDetailsVo != nil) {
            self.restaurantDetailVo = restaurantDetailsVo
            self.collectionView?.reloadData()
        }
    }
}

