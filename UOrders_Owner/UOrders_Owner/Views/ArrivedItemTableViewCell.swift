//
//  ArrivedItemTableViewCell.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/12/02.
//

import UIKit

class ArrivedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var arrivedItemNameLabel: UILabel!
    @IBOutlet weak var arrivedItemInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
