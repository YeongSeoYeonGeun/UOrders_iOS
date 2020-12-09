//
//  OrderManageData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation

//주문 관리 데이터
struct OrderListResult:Codable{
    let status : Int
    let message : String
    let data : OrderData
}

struct OrderData:Codable{
    let cafeName : String
    let cafeLocation : String
    let orderInfo : [OrderInfo]
}

struct OrderInfo:Codable{
    let ticketNumber : Int
    let orderID : String
    let orderTime : String
    let menuInfo : [MenuInfo]
}

struct MenuInfo:Codable{
    let menuIndex : Int
    let menuName : String
    let menuTemperature : String
    let menuSize : String
    let menuTakeType : String
}
