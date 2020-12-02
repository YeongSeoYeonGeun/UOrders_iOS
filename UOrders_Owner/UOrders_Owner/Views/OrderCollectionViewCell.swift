//
//  OrderCollectionViewCell.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/30.
//

import UIKit

struct Item{
    var itemName : String
    var itemCondition : String
}

class OrderCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
//    @IBOutlet weak var orderitemTableView: UITableView!
    
    let itemList = [
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        orderitemTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "itemTableViewCell")
//        setItemTableView()
    }
    
    
//    func setItemTableView() {
//        orderitemTableView.delegate = self
//        orderitemTableView.dataSource = self
//        orderitemTableView.tableFooterView = UIView()
//
//    }
}

