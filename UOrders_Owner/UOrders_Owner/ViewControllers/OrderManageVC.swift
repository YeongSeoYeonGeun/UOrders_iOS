//
//  TestTableVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

struct Drink {
    var itemName : String
    var itemCondition : String
}

struct Order {
    var customerName : String
    var orderNumber : String
    var itemList : [Drink]
    var leftTime : String
}

class OrderManageVC : UIViewController {
    
    @IBOutlet weak var orderTableView: UITableView!
    
    let OrderList = [
        Order(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [Drink(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분"),
        Order(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [Drink(itemName: "카페라떼", itemCondition: "(ICED/REGULAR/GO TO)"),
                             Drink(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
                             Drink(itemName: "플랫화이트", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분"),
        Order(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [Drink(itemName: "민트초코", itemCondition: "(ICED/REGULAR/GO TO)"),
                             Drink(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
    }
    
    func setOrderTableView() {
        self.orderTableView.delegate = self
        self.orderTableView.dataSource = self
        self.orderTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let headerNib = UINib(nibName: "OrderListSectionHeader", bundle: nil)
        self.orderTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "orderListSectionHeader")
        
        let footerNib = UINib(nibName: "OrderListSectionFooter", bundle: nil)
        self.orderTableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "orderListSectionFooter")
    }


}

extension OrderManageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.orderTableView.dequeueReusableHeaderFooterView(withIdentifier: "orderListSectionHeader") as! OrderListSectionHeader
    
        headerView.customerName.text = "시연"
        
        return headerView
    }
    
    func tableView(_  tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = self.orderTableView.dequeueReusableHeaderFooterView(withIdentifier: "orderListSectionFooter") as! OrderListSectionFooter
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.OrderList[section].itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemTableViewCell", for:indexPath) as! OrderItemTableViewCell
        
        let sectionOrder = OrderList[indexPath.section]
        cell.itemNameLabel.text = sectionOrder.itemList[indexPath.row].itemName
        cell.itemConditionLabel.text = sectionOrder.itemList[indexPath.row].itemCondition
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.OrderList.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
