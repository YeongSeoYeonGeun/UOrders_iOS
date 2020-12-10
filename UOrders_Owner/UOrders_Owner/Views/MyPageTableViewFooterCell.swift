//
//  MyPageTableViewFooterCell.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/10.
//

import UIKit

class MyPageTableViewFooterCell: UITableViewCell {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

