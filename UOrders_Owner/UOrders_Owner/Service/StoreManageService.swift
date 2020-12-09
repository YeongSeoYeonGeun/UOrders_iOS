//
//  StoreManageMainAPI.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/04.
//

import Foundation
import Alamofire
import SwiftyJSON

class StoreManageService {
    static let shared : StoreManageService = StoreManageService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getStoreManageMain(completionHandler: @escaping (Result<CafeMenuDataResult, Error>) -> Void){
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex": "1" ]
        
        let request = AF.request("\(Config.baseURL)/owner/cafe/\(13)", method : .get, headers: requestHeader)
        request.responseData { response in
            switch response.result {
            case .success(let successResult):
                let decoder : JSONDecoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                guard let cafeData = try? decoder.decode(CafeMenuDataResult.self, from: successResult) else {
                    print("Decoding Fail")
                    return
                }
                completionHandler(.success(cafeData))
            case .failure(let error) :
                print(error)
                completionHandler(.failure(error))
            }
        }
    }
}
