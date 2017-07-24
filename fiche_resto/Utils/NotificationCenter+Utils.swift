//
//  NotificationCenter_Utils.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    func addObserver(_ observer: Any, selector: Selector, name: String){
        
        self.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
    }
}
