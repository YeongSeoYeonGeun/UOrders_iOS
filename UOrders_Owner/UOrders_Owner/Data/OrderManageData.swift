//
//  OrderManageData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation

//주문 관리 데이터
struct OrderListDataResult : Codable{
    let status : Int
    let message : String
    let data : CafeAndOrder
}

struct CafeAndOrder : Codable {
    let cafeName : String
    let cafeLocation : String
    let orderInfo : [Order]
}

struct Order : Codable {
    let ticketNumber : Int
    let orderID : String
    let orderTime : Int
    let menuInfo : [MenuItem]
}

struct MenuItem : Codable {
    let menuIndex : Int
    let menuName : String
    let menuTemperature : String
    let menuSize : String
    let menuTakeType : String
}
