//
//  OrderManageService.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrderManageService {
    static let shared : OrderManageService = OrderManageService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getOrderList(completionHandler: @escaping (Result<OrderListDataResult, Error>) -> Void) {
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex": "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/orders/main", method : .get, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse):
                let decoder = JSONDecoder()
                
                do {
                    let myPageResponse = try decoder.decode(OrderListDataResult.self, from: dataResponse.data!)
                    print(myPageResponse)
                    
                    completionHandler(.success(myPageResponse))
                } catch {
                    print(error)
                }
                
            case .failure(let error) :
                print(error)
                completionHandler(.failure(error))
                
            }
        }
    }
}
