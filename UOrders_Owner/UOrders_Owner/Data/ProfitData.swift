//
//  ProfitData.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/09.
//

import Foundation

struct ProfitResponse : Codable {
    let status : Int
    let message : String
    let data : Profit
}

struct Profit : Codable {
    let cafeName : String
    let ownerName : String
    let businessNumber : String
    let revenueInfo : [RevenueInfo]
}

struct RevenueInfo : Codable {
    let year : Int
    let month : Int
    let revenue : Int
}
