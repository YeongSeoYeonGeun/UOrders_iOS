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
                     Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분")
                     ]
    
    
    @IBOutlet var orderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
    }
    
    func setOrderTableView() {
        
        let orderLayout = UICollectionViewFlowLayout()
        orderLayout.minimumLineSpacing = 0
        orderLayout.minimumInteritemSpacing = 0
        orderLayout.sectionInset = UIEdgeInsets.zero
//        orderLayout.itemSize = CGSize(width: self.view.frame.width, height: 50)
        
        
        orderCollectionView.delegate = self
        orderCollectionView.dataSource = self
        
    }

}

extension OrderManageVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCollectionViewCell", for: indexPath)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.orderList.count
    }
    
}
