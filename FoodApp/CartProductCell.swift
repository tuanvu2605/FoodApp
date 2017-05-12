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
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productIcon.contentMode = .scaleAspectFill
        productIcon.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func display_(_ cartProduct : CartProduct) {
        
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOffset = CGSize(width: 3, height: 3);
        bgView.layer.shadowOpacity = 0.5;
        bgView.layer.shadowRadius = 1.0;
        
        backgroundColor = .clear
        productName.text = cartProduct.product.productName
        productInfo.text = cartProduct.product.des
        productIcon.sd_setImage(with: URL(string: cartProduct.product.imageURL)!)
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        price.text =  fmt.string(from: NSNumber(value: cartProduct.product.price))! + AppString.currency
        count.text = "\(cartProduct.count)"
        
    }
    
}
