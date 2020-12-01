//
//  OrderCollectionViewCell.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/30.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
