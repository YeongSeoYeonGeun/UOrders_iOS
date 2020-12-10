//
//  LoginService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/10.
//


import Foundation
import Alamofire
import SwiftyJSON


class LoginService {
    static let shared : LoginService = LoginService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func login(loginData : LoginData, completionHandler : @escaping (Result<Any, Error>) -> Void) {
        
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let parameterData = loginData.parameterRepresentation
        
        let request = AF.request("\(Config.baseURL)/owner/login", method: .post, parameters : parameterData, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse):
                
                completionHandler(.success(successResponse))
            case .failure(let error) :
              
                completionHandler(.failure(error))
                
            }
        }
    }
    
}


