//
//  AbstractPresenter.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class AbstractPresenter<T>: NSObject {
    
    private weak var _delegate: AnyObject?
    
    var delegate: T? {
        get {
            return _delegate as? T
        }
        set {
            _delegate = newValue as AnyObject?
        }
    }
    
    init(delegate: T) {
        super.init()
        self.delegate = delegate
        self.registerNotification()
    }
    
    func registerNotification() {}
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
