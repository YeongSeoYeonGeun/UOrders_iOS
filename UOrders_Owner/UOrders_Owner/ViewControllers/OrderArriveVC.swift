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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemTableView()
        acceptOrderButton.layer.cornerRadius = 4
    }
}
extension OrderArriveVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arrivedItemTableViewCell", for: indexPath) as! ArrivedItemTableViewCell
        
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
