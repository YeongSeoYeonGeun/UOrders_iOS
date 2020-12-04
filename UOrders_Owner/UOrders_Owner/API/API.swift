//
//  StoreManageMainAPI.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/04.
//

import Foundation
import Alamofire

class API {
    static let shared : API = API()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getStoreManageMain() -> {
        print("in getStoreManageMain")
        
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
        "ownerIndex": "1" ]
        
        self.request = AF.request("\(Config.baseURL)/owner/cafe/\(13)", method : .get, headers: requestHeader).responseJSON {
            response in
            switch response.result{
            case .success(let successResult) :
                print(successResult)
            case .failure(let error) :
                print(error)
            }
        }

    }
    
    
}
