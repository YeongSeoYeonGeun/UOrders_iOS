//
//  LoginData.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/10.
//

import Foundation

struct LoginData : Codable {
    let ownerId : String
    let ownerPw : String
    let deviceToken : String
    
    var parameterRepresentation: [String : Any] {
        return [
            "ownerId" : ownerId,
            "ownerPw" : ownerPw,
            "deviceToken" : deviceToken
        ]
    }
}
