//
//  MyPageOrderTableViewCell.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/09.
//

import UIKit

class MyPageTableViewContentCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemConditionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
