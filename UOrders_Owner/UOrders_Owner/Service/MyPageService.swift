//
//  MyPageService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import Foundation
import Alamofire
import SwiftyJSON


class MyPageService {
    static let shared : MyPageService = MyPageService()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private init() {}
    
    func getMyPage(ownerIndex : String, cafeIndex : String, completion : @escaping (Result<MyPageResponse, Error>) -> Void){
    
        print("hello!")
        
        let requestHeader : HTTPHeaders = [
            "Content-Type" : "application/json",
            "ownerIndex": ownerIndex ,
            "cafeIndex" : cafeIndex
        ]
        
        let request = AF.request("\(Config.baseURL)/mypage", method: .get, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
                case .success(let successResponse):
                        
                    let decoder = JSONDecoder()

                    do {
                        print(dataResponse.data)
                        let myPageResponse = try decoder.decode(MyPageResponse.self, from: dataResponse.data!)
                        print(myPageResponse)
                            
                        completion(.success(myPageResponse))
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
