//
//  Category.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var  categoryId = Int()
    var  categoryName = String()
    var  imageURL = String()
    var  notes : String?
    
    
    init(dict : [String : Any]) {
        
        self.categoryId = dict["categoryId"] as! Int
        self.categoryName = dict["categoryName"] as! String
        self.imageURL = dict["imageURL"] as! String
        self.notes = dict["notes"] as? String
    }
    

}
