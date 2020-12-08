//
//  Data.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/04.
//

import Foundation

//매장 관리 데이터
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


//주문 관리 데이터
struct OrderListResult : Codable {
    let message : String
    let status : Int
    let data : OrderData
}

struct OrderData : Codable {
    let cafeName : String
    let cafeLocation : String
    let orderInfo : [OrderInfo]
}

struct OrderInfo : Codable {
    let ticketNumber : Int
    let orderID : String
    let orderTime : String
    let menuInfo : [MenuInfo]
}

struct MenuInfo : Codable {
    let menuIndex : Int
    let menuName : String
    let menuTemperature : String
    let menuSize : String
    let menuTakeType : String
}





