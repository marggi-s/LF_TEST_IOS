//
//  AbstractService.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class AbstractService: NSObject {
    func readJSON(from filename: String) -> String? {
        let path: String = Bundle.main.path(forResource: filename, ofType: "json")!
        return try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
    }
}
