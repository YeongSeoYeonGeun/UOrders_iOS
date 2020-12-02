//
//  TestTableVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

struct TestItem {
    var itemName : String
    var itemCondition : String
}

struct TestOrder {
    var customerName : String
    var orderNumber : String
    var itemList : [TestItem]
    var leftTime : String
}

class TestTableVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var testTableView: UITableView!

    let testOrderList = [
        TestOrder(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분"),
        TestOrder(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
                             TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
                             TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분"),
        TestOrder(customerName: "시연 님", orderNumber: "(No. 14)",
                  itemList: [TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)"),
                             TestItem(itemName: "아메리카노", itemCondition: "(ICED/REGULAR/GO TO)")],
                  leftTime: "17분")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView.delegate = self
        testTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testOrderList[section].itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testTableViewCell", for: indexPath) as! TestTableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.testOrderList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

}
