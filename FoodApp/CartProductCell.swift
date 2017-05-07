//
//  CartProductCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/4/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class CartProductCell: UITableViewCell {


    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productInfo: UILabel!
    @IBOutlet weak var productIcon: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productIcon.contentMode = .scaleAspectFill
        productIcon.layer.cornerRadius = 3
        productIcon.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func display_(_ cartProduct : CartProduct) {
        
        productName.text = cartProduct.product.productName
        productInfo.text = cartProduct.product.des
        productIcon.sd_setImage(with: URL(string: cartProduct.product.imageURL)!)
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        price.text =  fmt.string(from: NSNumber(value: cartProduct.product.price))! + AppString.currency
        count.text = "\(cartProduct.count)"
        
    }
    
}
