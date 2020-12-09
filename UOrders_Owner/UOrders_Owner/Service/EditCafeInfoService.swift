//
//  EditCafeInfoService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/10.
//

import Foundation
import Alamofire
import SwiftyJSON


class EditCafeInfoService {
    static let shared : EditCafeInfoService = EditCafeInfoService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func editCafeInfo(ownerIndex : String, cafeIndex : String, editedCafeInfo : EditedCafeInfo, completionHandler : @escaping (Result<Any, Error>) -> Void) {
        
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex" : ownerIndex,
            "cafeIndex" : cafeIndex
        ]
        
        
        let parameterData = editedCafeInfo.parameterRepresentation
        
        let request = AF.request("\(Config.baseURL)/mypage/cafe", method: .put, parameters : parameterData, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse):
                print("********** edit cafe info api service SUCCESS **********")
                print(JSON(successResponse))
                completionHandler(.success(successResponse))
            case .failure(let error) :
                print("********** edit cafe info api service FAIL **********")
                print(error)
                completionHandler(.failure(error))
                
            }
        }
    }
    
}

