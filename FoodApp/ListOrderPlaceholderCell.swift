//
//  ListOrderPlaceholderCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/11/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class ListOrderPlaceholderCell: UITableViewCell {
    
    @IBOutlet weak var shimmeringView: FBShimmeringView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
    }
    
    func displayPlaceholder() {
        
        
        let placeholer = Bundle.main.loadNibNamed("ListOrderPlaceholder", owner: nil, options: nil)?.first as! ListOrderPlaceholder
        placeholer.frame = self.bounds
        shimmeringView.addSubview(placeholer)
        shimmeringView.isShimmering = true
        shimmeringView.shimmeringBeginFadeDuration = 5.0
        shimmeringView.shimmeringBeginTime = 5.0
        shimmeringView.shimmeringOpacity  = 1.0
        shimmeringView.contentView = placeholer
        
    }


}
