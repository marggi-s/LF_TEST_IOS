//
//  RestaurantService.swift
//  fiche_resto
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol RestaurantServiceProtocol {
    func getRestaurantDetails(restaurantId: Int, completion: @escaping (RestaurantEntity?, String?) -> Void)
}

#if MOCK
    class RestaurantServiceMock : AbstractMock, RestaurantServiceProtocol {
        func getRestaurantDetails(restaurantId: Int, completion: @escaping (RestaurantEntity?, String?) -> Void) {
            
            DispatchQueue.main.async {
                guard let json = self.readJSON(from: "get_restaurant_details") else {
                    completion(nil, "service.error.json".localized)
                    return
                }
                guard let containerResponse: ContainerResponse = Mapper<ContainerResponse>().map(JSONString: json) else {
                    completion(nil, "service.error.json".localized)
                    return
                }
                guard let restaurantEntity: RestaurantEntity = RestaurantConverter.reponseToEntity(response: containerResponse.data!) else {
                    completion(nil, "service.error.json".localized)
                    return
                }
                completion(restaurantEntity, nil)
                
            }
        }
    }
#else
    class RestaurantService : AbstractService, RestaurantServiceProtocol {
        func getRestaurantDetails(restaurantId: Int, completion: @escaping (RestaurantEntity?, String?) -> Void) {

            var parameters: [String: Any] = [:]
            
            parameters["key"] = "IPHONEPRODEDCRFV"
            parameters["method"] = "restaurant_get_info"
            parameters["id_restaurant"] = restaurantId
            
            Alamofire.request(
                URL(string: UrlApp.baseUrl)!,
                method: .get,
                parameters: parameters)
                .validate()
                .responseObject { (response: DataResponse<ContainerResponse>) in
                    print(response.result.value!)
                    
                    guard response.result.isSuccess else {
                        completion(nil, response.result.error?.localizedDescription)
                        return
                    }
                    guard let response = response.result.value else {
                        
                        completion(nil, "service.error.json".localized)
                        return
                    }
                    if let restaurantEntity: RestaurantEntity = RestaurantConverter.reponseToEntity(response: response.data!) {
                        completion(restaurantEntity, nil)
                    } else {
                        completion(nil, "service.error.json".localized)
                    }
            }
        }
    }
#endif
