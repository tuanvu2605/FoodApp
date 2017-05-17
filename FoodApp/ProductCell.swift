//
//  ProductCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

enum BuyState {
    case buyNow
    case buyed
}

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var providerAvatar: UIImageView!

    @IBOutlet weak var providerName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var btnBuyNow: UIButton!
    var didBuyProduct = ({ ()->Void in
    })
    var state : BuyState = .buyNow
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        providerAvatar.layer.cornerRadius = providerAvatar.frame.size.height/2
        providerAvatar.clipsToBounds = true
        productImage.contentMode  = .scaleAspectFill
        
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
        providerName.adjustsFontSizeToFitWidth = true
        gradient()
        
        btnBuyNow.setTitle(AppString.buyNow, for: .normal)
        
      
        
        // Initialization code
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
    }
    
    private func gradient()
    {
        productImage.frame.size.width = (AppSize.screenWidth - 30)/2
        productImage.frame.size.height = productImage.frame.size.width
        let gradient  = CAGradientLayer()
        gradient.frame = productImage.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(0).cgColor , UIColor.black.withAlphaComponent(0.3).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0);
        gradient.endPoint = CGPoint(x: 0, y: 1);
        productImage.layer.insertSublayer(gradient, at: 1)
    }
    

    @IBAction func btnBuyNowDidTap(_ sender: Any) {
        
        if state == .buyed
        {
            return
        }
        
        btnBuyNow.setTitle(AppString.buyed, for: .normal)
        self.didBuyProduct()
        
    }

    func display_(product : Product)
    {
       
        if CartController.shared.listItem.contains(where: { $0.product == product}) {
            state = .buyed
            btnBuyNow.setTitle(AppString.buyed, for: .normal)
        }else
        {
            state = .buyNow
            btnBuyNow.setTitle(AppString.buyNow, for: .normal)
        }
        
        productImage.sd_setImage(with: URL(string: product.imageURL))
        productName.text = product.productName
        providerAvatar.sd_setImage(with: URL(string: product.provider.avatarURL))
        providerName.text = product.provider.firstName + " " + product.provider.lastName
        productPrice.text = Utils.formatNumberCurrency(NSNumber(value: product.price)) + AppString.currency
        
    }

}
