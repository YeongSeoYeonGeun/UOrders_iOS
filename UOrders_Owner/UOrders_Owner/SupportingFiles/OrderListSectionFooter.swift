//
//  OrderListSectionFooter.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class OrderListSectionFooter : UITableViewHeaderFooterView {
    
    let orderCompleteBox = UIView()
    let orderCompleteLabel = UILabel()
    let sectionBar = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.white
        setContentCondition()
        putContentOnView()
    }
    
    func setContentCondition() {
        orderCompleteBox.backgroundColor = UIColor(red: 11/255, green: 70/255, blue: 60/255, alpha: 1)
        orderCompleteBox.layer.cornerRadius = 4
        
        orderCompleteLabel.text = "주문 처리 완료"
        orderCompleteLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        orderCompleteLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        sectionBar.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    }
    
    func putContentOnView() {
        orderCompleteBox.translatesAutoresizingMaskIntoConstraints = false
        orderCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(orderCompleteBox)
        self.orderCompleteBox.addSubview(orderCompleteLabel)
        self.contentView.addSubview(sectionBar)
        
        orderCompleteBox.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        orderCompleteBox.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        orderCompleteBox.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        orderCompleteBox.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        orderCompleteBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        
        orderCompleteLabel.centerXAnchor.constraint(equalTo: orderCompleteBox.centerXAnchor).isActive = true
        orderCompleteLabel.centerYAnchor.constraint(equalTo: orderCompleteBox.centerYAnchor).isActive = true
        
        sectionBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        sectionBar.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        sectionBar.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        sectionBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }

}
