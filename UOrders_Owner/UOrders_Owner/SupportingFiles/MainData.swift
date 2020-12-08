//
//  Data.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/04.
//

import Foundation

struct CafeMenuDataResult : Codable {
    let message : String
    let status : Int
    let data : CafeData
}

struct CafeData : Codable {
    let cafeLocation : String
    let menuInfo : [Menu]
    let cafeName : String
}

struct Menu : Codable{
    let menuImage : String
    let menuIndex : Int
    let menuName : String
    let menuPrice : Int
}
