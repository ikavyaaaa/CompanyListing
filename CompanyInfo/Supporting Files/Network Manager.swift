//
//  Network Manager.swift
//  CompanyInfo
//
//  Created by Kavya on 29/08/22.
//

import Foundation

import Foundation
import Alamofire

class Networking {
    
    static let sharedNetworking = Networking()
    
    private init() {}
    
    final func getMethod(url: String, completion: @escaping(Data?, String) ->() ) {
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default)
            .response { response in
                switch response.result {
                case .success(let responseData):
                    completion(responseData, "Success")
                case .failure(_):
                    completion(nil, "Something went wrong")
                }
            }
    }
    
}
