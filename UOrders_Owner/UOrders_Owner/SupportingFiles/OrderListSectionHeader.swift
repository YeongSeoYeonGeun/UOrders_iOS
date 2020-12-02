//
//  OrderListSectionHeader.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class OrderListSectionHeader: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let customerName = UILabel()
    let orderNumber = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        
        configureContent()
    }
    
    func configureContent() {
        customerName.translatesAutoresizingMaskIntoConstraints = false
        orderNumber.translatesAutoresizingMaskIntoConstraints = false
        
    
        contentView.addSubview(customerName)
//        contentView.addSubview(orderNumber)
    }
}
