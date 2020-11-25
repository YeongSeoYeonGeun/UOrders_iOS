//
//  OrderManageVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/16.
//

import UIKit

struct Order {
    var customerName : String
    var orderNumber : String
    var leftTime : String
}

class OrderManageVC: UIViewController {
    
    let orderList = [Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),
                     Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),
                     Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),
                     Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),
                     Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),]
    
    @IBOutlet weak var orderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
    }
    
    func setOrderTableView() {
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.tableFooterView = UIView()
        orderTableView.estimatedRowHeight =  185
        orderTableView.rowHeight = UITableView.automaticDimension
    }

}

extension OrderManageVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell", for: indexPath) as! OrderTableViewCell
        
        cell.customerNameLabel.text = orderList[indexPath.row].customerName
        cell.orderNumberLabel.text = orderList[indexPath.row].orderNumber
        cell.leftTimeLabel.text = orderList[indexPath.row].leftTime
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
