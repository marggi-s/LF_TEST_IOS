//
//  Double+Utils.swift
//  fiche_resto
//
//  Created by Admin on 24/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

extension Double {
    
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
