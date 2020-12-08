//
//  MainData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation

struct CafeDataResult : Codable {
    let status : Int
    let message : String
    let data : CafeNameAndLocation
}

struct CafeNameAndLocation : Codable {
    let cafeName : String
    let cafeLocation : String
}
