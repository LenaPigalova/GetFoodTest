//
//  MenuTableViewCell.swift
//  GetFood
//
//  Created by Пигалова Елена on 05/04/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var goodsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
