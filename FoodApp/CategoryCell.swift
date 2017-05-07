//
//  CategoryCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        categoryIcon.contentMode = .scaleAspectFill
        title.adjustsFontSizeToFitWidth = true
        
        let gradient  = CAGradientLayer()
        gradient.frame = categoryIcon.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(0).cgColor , UIColor.black.withAlphaComponent(1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0);
        gradient.endPoint = CGPoint(x: 0, y: 1);
        
        categoryIcon.layer.insertSublayer(gradient, at: 1)
      
        
        // Initialization code
    }
    
    func displayWithCategory(_ cate : Category)
    {
        categoryIcon.sd_setImage(with: URL(string: cate.imageURL)!)
        title.text = cate.categoryName
    }

}
