//
//  ListOrderPlaceholder.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/11/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class ListOrderPlaceholder: UIView {
    
    
    @IBOutlet weak var circle: UIView!
    
    override func awakeFromNib() {
        
        circle.layer.cornerRadius = 40
        circle.clipsToBounds = true
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
