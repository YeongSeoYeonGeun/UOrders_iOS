//
//  MyPageService.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import Foundation

class MyPageService {
    static let shared : MyPageService = MyPageService()
    
    private var request: DataRequest {
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
                do{
                    let decoder : JSONDecoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let cafeData = try? decoder.decode(CafeMenuDataResult.self, from: successResult)
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
