//
//  PlaceholderCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/29/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class PlaceholderCell: UICollectionViewCell {

    @IBOutlet weak var shimmeringView: FBShimmeringView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
    }
    
     func displayPlaceholder() {
        

        let placeholer = Bundle.main.loadNibNamed("Placeholder", owner: nil, options: nil)?.first as! Placeholder
        placeholer.frame = self.bounds
        shimmeringView.addSubview(placeholer)
        shimmeringView.isShimmering = true
        shimmeringView.shimmeringBeginFadeDuration = 5.0
        shimmeringView.shimmeringBeginTime = 5.0
        shimmeringView.shimmeringOpacity  = 1.0
        shimmeringView.contentView = placeholer
        
    }

}
