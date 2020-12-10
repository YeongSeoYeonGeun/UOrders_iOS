//
//  OrderArriveService.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/10.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrderArriveService {
    static let shared : OrderArriveService = OrderArriveService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getArrivedOrder(completionHandler : @escaping (Result<OrderArriveResult, Error>) -> Void) {
        let requestHeader : HTTPHeaders = [
            "Content-Type": "application/json",
            "ownerIndex": "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/owner/alarm", method: .get, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
                case .success(let successResponse):
                        
                    let decoder = JSONDecoder()

                    do {
                        print("***********************")
                        print(JSON(dataResponse.data))
                        let orderArriveData = try decoder.decode(OrderArriveResult.self, from: dataResponse.data!)
                        print(orderArriveData)
                            
                        completionHandler(.success(orderArriveData))
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
