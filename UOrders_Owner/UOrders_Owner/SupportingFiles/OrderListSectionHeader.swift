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
    
    let customerNameLabel = UILabel()
    let orderNumberLabel = UILabel()
    let leftTimeLabel = UILabel()
    
    
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
        customerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        orderNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(customerNameLabel)
        contentView.addSubview(orderNumberLabel)
        contentView.addSubview(leftTimeLabel)
    }
    
    func stackViewFactory(type : NSLayoutConstraint.Axis) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.alignment = .leading
        
        return row
    }
}
