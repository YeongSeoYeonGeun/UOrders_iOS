//
//  OrderListSectionHeader.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class OrderListSectionHeader: UITableViewHeaderFooterView {
    
    let customerNameLabel = UILabel()
    let orderNumberLabel = UILabel()
    let untilCompleteLabel = UILabel()
    let leftTimeLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.white
        setContentConditon()
        putContentOnView()
    }
    
    func setContentConditon()  {
        customerNameLabel.text = "승아 님"
        customerNameLabel.font = customerNameLabel.font.withSize(20)
        customerNameLabel.textColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
        
        orderNumberLabel.text = "(No. 32)"
        orderNumberLabel.font = orderNumberLabel.font.withSize(20)
        orderNumberLabel.textColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
        
        untilCompleteLabel.text = "완료까지"
        untilCompleteLabel.font = untilCompleteLabel.font.withSize(20)
        untilCompleteLabel.textColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
        
        leftTimeLabel.text = "25분"
        leftTimeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        leftTimeLabel.textColor = UIColor(red: 11/255, green: 70/255, blue: 60/255, alpha: 1)
    }
    
    func putContentOnView() {
        customerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        orderNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        untilCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(customerNameLabel)
        self.contentView.addSubview(orderNumberLabel)
        self.contentView.addSubview(untilCompleteLabel)
        self.contentView.addSubview(leftTimeLabel)
        
        //content autolayout 적용
        customerNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        customerNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        orderNumberLabel.centerYAnchor.constraint(equalTo: customerNameLabel.centerYAnchor).isActive = true
        orderNumberLabel.leftAnchor.constraint(equalTo: customerNameLabel.rightAnchor, constant: 5).isActive = true
        
        leftTimeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        leftTimeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        untilCompleteLabel.centerYAnchor.constraint(equalTo: leftTimeLabel.centerYAnchor).isActive = true
        untilCompleteLabel.rightAnchor.constraint(equalTo: leftTimeLabel.leftAnchor, constant: -5).isActive = true
        
    }
}
