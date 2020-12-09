//
//  TestTableVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class OrderManageVC : UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    var OrderList : OrderListResult! {
        didSet {orderTableView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
        
        OrderManageService.shared.getOrderList() {
            result in
            switch result {
            case .success(let successData) :
                print(".success")
                print(successData)
                guard successData.self != nil  else { return }
                self.OrderList = successData
                
            case .failure(let error) :
                print("getOrderList Error ", error)
            }
        }
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
        
        headerView.customerNameLabel.text = OrderList.data.orderInfo[section].orderID
        headerView.orderNumberLabel.text = String(OrderList.data.orderInfo[section].ticketNumber)
        headerView.leftTimeLabel.text = OrderList.data.orderInfo[section].orderTime
        
        return headerView
    }
    
    func tableView(_  tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = self.orderTableView.dequeueReusableHeaderFooterView(withIdentifier: "orderListSectionFooter") as! OrderListSectionFooter
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderList.data.orderInfo[section].menuInfo.count
    }
    
    func deleteSections(_ sections: IndexSet, with : UITableView.RowAnimation){
        print("deleteSections")
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemTableViewCell", for:indexPath) as! OrderItemTableViewCell
        
        let sectionOrder = OrderList.data.orderInfo[indexPath.section].menuInfo
        cell.itemNameLabel.text = sectionOrder[indexPath.row].menuName
        cell.itemConditionLabel.text = "(" + sectionOrder[indexPath.row].menuTemperature + "/" + sectionOrder[indexPath.row].menuSize + "/" + sectionOrder[indexPath.row].menuTakeType + ")"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let orderList = self.OrderList {
            return orderList.data.orderInfo.count
        }else {
            return 0
        }
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
