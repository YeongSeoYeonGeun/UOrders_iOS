//
//  StoreManageViewController.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/25.
//

import UIKit

struct Menu {
//    var menuPhoto : String
    var menuName : String
    var menuPrice : String
}

class StoreManageVC: UIViewController {
    
    let menuList = [Menu(menuName: "아메리카노", menuPrice: "1,000원"),
                    Menu(menuName: "카페라떼", menuPrice: "1,500원"),
                    Menu(menuName: "카페모카", menuPrice: "2,000원"),
                    Menu(menuName: "플랫화이트", menuPrice: "1,000원"),
                    Menu(menuName: "콜드브루 아메리카노", menuPrice: "1,500원"),
                    Menu(menuName: "아메리카노", menuPrice: "1,000원"),
                    Menu(menuName: "카페라떼", menuPrice: "1,500원"),
                    Menu(menuName: "카페모카", menuPrice: "2,000원"),
                    Menu(menuName: "플랫화이트", menuPrice: "1,000원"),
                    Menu(menuName: "콜드브루 아메리카노", menuPrice: "1,500원")]

    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var menuAddButton: UIButton!
    
    private var handler: ((Result<cafeData, Error>))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStoreTableView()
        API.shared.getStoreManageMain()
    }
    
    func setStoreTableView() {
        storeTableView.delegate = self
        storeTableView.dataSource = self
        storeTableView.tableFooterView = UIView()
    }
    
    func setAddButton() {
        NSLayoutConstraint.activate([
            menuAddButton.bottomAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.bottomAnchor, constant: -30),
            menuAddButton.trailingAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
}

extension StoreManageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeTableViewCell", for: indexPath) as! StoreTableViewCell
        
        cell.menuPhotoImage.layer.cornerRadius = cell.menuPhotoImage.frame.width/2
        cell.clipsToBounds = true
        
        cell.menuNameLabel.text = menuList[indexPath.row].menuName
        cell.menuPriceLabel.text = menuList[indexPath.row].menuPrice
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
