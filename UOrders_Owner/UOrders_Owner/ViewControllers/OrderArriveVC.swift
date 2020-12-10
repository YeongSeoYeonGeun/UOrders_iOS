//
//  OrderArriveVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class OrderArriveVC: UIViewController {

    @IBOutlet weak var arriveMessageLabel: UILabel!
    
    @IBOutlet weak var arrivedItemTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var acceptOrderButton: UIView!
    
    var arrivedOrderData : ArrivedOrder! {
        didSet {
            self.arriveMessageLabel.text = arrivedOrderData.orderID + " 님의 주문 도착!"
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            let price = numberFormatter.string(for: Int(arrivedOrderData.totalPrice))!
            self.totalPriceLabel.text = price + "원"
            
            self.arrivedItemTableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemTableView()
        acceptOrderButton.layer.cornerRadius = 4
        
        OrderArriveService.shared.getArrivedOrder() {
            result in
            switch result {
            case .success(let successData) :
                print("getArrivedOrder success")
                self.arrivedOrderData = successData.data
                print(self.arrivedOrderData)
                
            case .failure(let error) :
                print("getArrivedOrder Error ", error)
            }
        }
    }
}
extension OrderArriveVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let orderlist = self.arrivedOrderData {
            return orderlist.menuInfo.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arrivedItemTableViewCell", for: indexPath) as! ArrivedItemTableViewCell
        
        cell.arrivedItemNameLabel.text = self.arrivedOrderData.menuInfo[indexPath.row].menuName
        cell.arrivedItemInfoLabel.text = "(" + self.arrivedOrderData.menuInfo[indexPath.row].menuTemperature
            + "/" + self.arrivedOrderData.menuInfo[indexPath.row].menuSize + "/" + self.arrivedOrderData.menuInfo[indexPath.row].menuTakeType + ")"
        
        return cell
    }
    
    func setItemTableView() {
        arrivedItemTableView.delegate = self
        arrivedItemTableView.dataSource = self
        arrivedItemTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
