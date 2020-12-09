//
//  MyPageService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import Foundation
import Alamofire
import SwiftyJSON


class MenuAddService {
    static let shared : MenuAddService = MenuAddService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func sendMenuAddInfo(newMenu : NewMenu, completionHandler : @escaping (Result<Any, Error>) -> Void) {
        print("menu api service called")
        
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        print(newMenu)
        let parameterData = newMenu.parameterRepresentation
        print(parameterData)
        
        let request = AF.request("\(Config.baseURL)/owner/menu", method: .post, parameters : newMenu.parameterRepresentation, encoding: JSONEncoding.default, headers: requestHeader)
        
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse):
                print("********** menu api service SUCCESS **********")
                print(JSON(successResponse))
                completionHandler(.success(successResponse))
            case .failure(let error) :
                print("********** menu api service FAIL **********")
                print(error)
                completionHandler(.failure(error))
                
            }
        }
    }
    
}

