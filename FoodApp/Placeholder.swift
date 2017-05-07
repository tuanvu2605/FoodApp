//
//  Placeholder.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/29/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class Placeholder: UIView {
    
     @IBOutlet weak var  viewTop : UIView!
     @IBOutlet weak var viewBottom : UIView!
    
    override func willMove(toSuperview newSuperview: UIView?) {
         viewBottom.backgroundColor =  UIColor("#E0E3E5")
        viewTop.backgroundColor = UIColor("#E0E3E5")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
