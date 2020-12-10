//
//  EditCafeInfo.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/10.
//

import Foundation

struct EditedCafeInfo : Codable {
    let cafeName : String
    let cafeLocation : String
    
    var parameterRepresentation: [String : Any] {
        return [
            "cafeName" : cafeName,
            "cafeLocation" : cafeLocation
        ]
    }
}
