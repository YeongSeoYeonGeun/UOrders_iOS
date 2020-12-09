//
//  MyPageData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/08.
//

import Foundation

struct MyPageResponse : Codable {
    let message : String
    let status : Int
    let data : MyPage
}

struct MyPage : Codable {
    let cafeInfo : CafeInfo
    let todayOrderInfo : [TodayOrderInfo]
}

struct CafeInfo : Codable {
    let cafeName : String
    let cafeLocation : String
    let cafeImage : String
}

struct TodayOrderInfo : Codable {
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
