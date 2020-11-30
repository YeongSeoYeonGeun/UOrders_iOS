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
    
    
    @IBOutlet weak var orderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
    }
    
    func setOrderTableView() {
        orderCollectionView.delegate = self
        orderCollectionView.dataSource = self
        
        let orderLayout = UICollectionViewFlowLayout()
        orderLayout.minimumLineSpacing = 0
        orderLayout.minimumInteritemSpacing = 0
        orderLayout.sectionInset = UIEdgeInsets.zero
        
        let collectionWidth = UIScreen.main.bounds.width
        orderLayout.itemSize = CGSize(width : collectionWidth, height: collectionWidth * 0.7)
        self.orderCollectionView.collectionViewLayout = orderLayout
        
        
    }

}

extension OrderManageVC : UICollectionViewDelegate, UICollectionViewDataSource {
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


//class HomeViewController: TaskManageViewController {
//    private var recommendedProductSizingCell: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        recommendedProductSizingCell = Bundle.main.loadNibNamed(String(describing: RecommendedProductCollectionViewCell.self), owner: self, options: nil)?.first as? UIView
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch collectionView {
//        case personalizedRecommendationCollectionView:
//            let layout = personalizedRecommendationCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            let sectionInset = layout.sectionInset
//            var margin: CGFloat = sectionInset.left + sectionInset.right
//            let numberOfItems = self.collectionView(personalizedRecommendationCollectionView, numberOfItemsInSection: indexPath.section)
//            let minimumLineSpacing = self.collectionView(collectionView, layout: layout, minimumLineSpacingForSectionAt: indexPath.section)
//            margin += CGFloat(numberOfItems - 1) * minimumLineSpacing
//            let width: CGFloat = (view.frame.width - margin) / CGFloat(numberOfItems)
//
//            recommendedProductSizingCell.imageViewWidthConstraint.constant = width
//
//            let fittingSize =  recommendedProductSizingCell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//
//            maxRecommendedProductCellHeight = max(maxRecommendedProductCellHeight, fittingSize.height + sectionInset.top + sectionInset.bottom)
//            personalizedRecommendationCollectionViewHeightConstraint.constant = maxRecommendedProductCellHeight
//
//            return CGSize(width: width, height: fittingSize.height)
//    }
//}
