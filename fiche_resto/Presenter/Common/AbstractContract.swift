//
//  AbstractContract.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

protocol AbstractPresenterContract: class {}

protocol AbstractViewContract: class {
    func displayError(error: String)
}
