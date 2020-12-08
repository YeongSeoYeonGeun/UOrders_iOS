//
//  MypageData.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import Foundation

struct MyPageResponse : Codable {
    let message : String
    let status : Int
    let data : MyPage
}

struct MyPage : Codable {
    let cafeInfo : CafeInfo
    let todayOrderInfo : [OrderInfo]
}

struct OrderInfo : Codable {
    let orderer : String
    let orderTime : String
    let orderMenuInfo : [OrderMenuInfo]
    let orderTotalPrice : Int
}

struct OrderMenuInfo : Codable {
    let orderMenuName : String
    let count : Int
    let temperature : String
    let takeType : String
}
