//
//  CartBarItem.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/9/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class CartBarItem: UIView {
    
    static let shared = Bundle.main.loadNibNamed("CartBarItem", owner: nil, options: nil)?.first as! CartBarItem
    //        print(cartView)
    
    @IBOutlet weak var cartIcon: UIImageView!
    @IBOutlet weak var count: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        count.layer.cornerRadius = count.frame.size.width/2
        count.clipsToBounds = true
        self.backgroundColor = .clear
        
        CartController.shared.listItemDidChangeValue = ({(count) in
           
           self.count.text = "\(count)"
           return
            
        })
        
        
    }
    



}
