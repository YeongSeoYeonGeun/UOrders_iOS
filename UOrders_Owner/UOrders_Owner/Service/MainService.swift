//
//  MainService.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation
import Alamofire
import SwiftyJSON

class MainService {
    static let shared : MainService = MainService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
//    func getOrderList(completionHandler: @escaping (Result<OrderListResult, Error>) -> Void) {
//        let requestHeader : HTTPHeaders = [
//            "Content-Type" : "application/json",
//            "ownerIndex": "1"
//        ]
//
//        let request = AF.request("\(Config.baseURL)/cafe/order", method: .get, headers: requestHeader)
//        request.responseData { response in
//            switch response.result {
//            case .success(let successResult):
//                do{
//                    let decoder : JSONDecoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                    let orderListData = try? decoder.decode(OrderListResult.self, from: successResult)
//                    completionHandler(.success(orderListData!))
//                }catch {
//                    print(error)
//                }
//            case .failure(let error) :
//                print(error)
//                completionHandler(.failure(error))
//            }
//        }
//
//    }
}
