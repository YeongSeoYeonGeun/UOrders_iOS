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
    
    func getOrderList(completionHandler: @escaping (Result<OrderListResult, Error>) -> Void) {
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex": "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/orders/main", method: .get, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success(let successResult):
                let orderDecoder : JSONDecoder = JSONDecoder()
                orderDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                guard let orderListData = try? orderDecoder.decode(OrderListResult.self, from: successResult) else {
                    print("Decoding Fail")
                    return
                }
                completionHandler(.success(orderListData))
            case .failure(let error) :
                print(error)
                completionHandler(.failure(error))
            }
        }
        
    }
}
