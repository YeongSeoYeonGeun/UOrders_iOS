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
    
    func getCafeNameAndLocation(completionHandler: @escaping (Result<CafeDataResult, Error>) -> Void) {
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]

        let request = AF.request("\(Config.baseURL)/owner/\(1)", method: .get, headers: requestHeader)
        request.responseData { response in
            switch response.result {
            case .success(let successResult):
                do{
                    let decoder : JSONDecoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let cafeData = try? decoder.decode(CafeDataResult.self, from: successResult)
                    completionHandler(.success(cafeData!))
                }catch {
                    print(error)
                }
            case .failure(let error) :
                print(error)
                completionHandler(.failure(error))
            }
        }

    }
}
