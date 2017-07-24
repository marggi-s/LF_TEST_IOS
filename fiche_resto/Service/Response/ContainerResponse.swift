//
//  ContainerResponse.swift
//  fiche_resto
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

class ContainerResponse: Mappable {
    
    // MARK: - Field
    var result : Int? = nil
    var resultCode : String? = nil
    var resultDetail : String? = nil
    var resultMsg : String? = nil
    var resultCached : String? = nil
    var data : RestaurantResponse?
    var sync : [String] = []
    
    // MARK: - mappable
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.result <- map["result"]
        self.resultCode <- map["result_code"]
        self.resultDetail <- map["result_detail"]
        self.resultMsg <- map["result_msg"]
        self.resultCached <- map["result_cached"]
        self.data <- map["data"]
        self.sync <- map["sync"]
    }
}
