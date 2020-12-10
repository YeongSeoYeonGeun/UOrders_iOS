//
//  OrderArriveData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/10.
//

import Foundation

struct OrderArriveResult : Codable{
    let status : Int
    let message : String
    let data : ArrivedOrder
}

struct ArrivedOrder : Codable{
    let userId : String
    let totalPrice : Int
    let menuInfo : [ArrivedItem]
}

struct ArrivedItem : Codable{
    let menuIndex : Int
    let menuName : String
    let menuTemperature : String
    let menuSize : String
    let menuTakeType : String
}
