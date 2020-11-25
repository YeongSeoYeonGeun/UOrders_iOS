//
//  StoreTableViewCell.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/25.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuPhotoImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuEditButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
