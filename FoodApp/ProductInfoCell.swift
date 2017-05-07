//
//  ProductInfoCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/5/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class ProductInfoCell: UITableViewCell {
    
    
    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var value: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
