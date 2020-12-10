//
//  ProfitService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/09.
//

import Foundation
import Alamofire
import SwiftyJSON


class ProfitService {
    static let shared : ProfitService = ProfitService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getProfitData(ownerIndex : String, cafeIndex : String, completion : @escaping (Result<ProfitResponse, Error>) -> Void){
    
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex": ownerIndex ,
            "cafeIndex" : cafeIndex
        ]
        
        let request = AF.request("\(Config.baseURL)/mypage/order", method: .get, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
                case .success(let successResponse):
                        
                    let decoder = JSONDecoder()

                    do {
                        let profitResponse = try decoder.decode(ProfitResponse.self, from: dataResponse.data!)
                            
                        completion(.success(profitResponse))
                    } catch {
                        print(error)
                    }
                        
                case .failure(let error) :
                    print(error)
                    completion(.failure(error))
                        
            }
        }
    }

}
