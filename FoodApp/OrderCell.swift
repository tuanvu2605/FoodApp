//
//  OrderCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/6/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

enum OrderCellType {
    case adress
    case phoneNo
    case time
    case note
}

class OrderCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    var type : OrderCellType!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        layoutIfNeeded()
        layoutSubviews()
        backgroundColor = .clear
        
        // Initialization code
    }
    
    func display_()
    {
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOffset = CGSize(width: 3, height: 3);
        bgView.layer.shadowOpacity = 0.5;
        bgView.layer.shadowRadius = 1.0;
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
