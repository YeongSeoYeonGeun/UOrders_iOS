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

class OrderCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var orderitemTableView: UITableView!
    
    let itemList = [
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
        Item(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        orderitemTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "itemTableViewCell")
        setItemTableView()
    }
    
    
    func setItemTableView() {
        orderitemTableView.delegate = self
        orderitemTableView.dataSource = self
        orderitemTableView.tableFooterView = UIView()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableViewCell", for: indexPath) as! ItemTableViewCell
        
        cell.itemNameLabel?.text = itemList[indexPath.row].itemName
        cell.itemConditionLabel?.text = itemList[indexPath.row].itemCondition

        return cell
    }
}

