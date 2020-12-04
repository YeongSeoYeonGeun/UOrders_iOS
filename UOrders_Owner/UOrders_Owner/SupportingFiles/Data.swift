//
//  Data.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/04.
//

import Foundation

struct cafeData : Decodable {
    let cafeName : String
    let cafeLocation : String
    let menuInfo : [menu]
}

struct menu : Decodable{
    let menuIndex : Int
    let menuName : String
    let menuPrice : Int
    let menuImage : String
}
