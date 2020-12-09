//
//  MenuAddData.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/09.
//

import Foundation


struct NewMenu : Codable {
    let cafeIndex : Int
    let menuIndex : Int
    let menuName : String
    let menuTemperature : Bool
    let menuSize : Bool
    let menuPrice : Int
    let soldOut : Int
    let menuIMG : String
    
    var parameterRepresentation: [String : Any] {
        return [
            "cafeIndex" : cafeIndex,
            "menuIndex" : menuIndex,
            "menuName" : menuName,
            "menuTemperature" : menuTemperature,
            "menuSize" : menuSize,
            "menuPrice" : menuPrice,
            "soldOut" : soldOut,
            "menuIMG" : menuIMG
        ]
    }
}
