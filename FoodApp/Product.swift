//
//  Product.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit


class CartProduct {
    
    var product : Product!
    var count = Int()
}

class Product: NSObject {
    
    var category : Category!
    var provider : Provider!
    var des :  String?
    var expiredDate : Date!
    var madeIn : String?
    var orderQuantity : Int!
    var price : Int!
    var productId : Int!
    var productName : String!
    var productionDate : Date!
    var quantity : Int!
    var remainingQuantity : Int!
    var statusFlag : Int!
    var unit : String!
    var imageURL : String!
    
   
    init(dict : [String :Any]) {
        
    
        category = Category(dict: dict["category"] as! [String : Any])
        provider = Provider(dict: dict["provider"] as! [String : Any])
        des = dict["description"] as? String
        if let longTime : NSNumber = dict["expiredDate"] as? NSNumber
        {
            expiredDate = Date(timeIntervalSince1970: longTime.doubleValue)
        }
        imageURL = dict["imageURL"] as! String
        madeIn = dict["madeIn"] as? String
        orderQuantity = dict["orderQuantity"] as! Int
        price = dict["price"] as! Int
        productId = dict["productId"] as! Int
        productName = dict["productName"] as! String
        if let longTime : NSNumber = dict["productionDate"] as? NSNumber
        {
            productionDate = Date(timeIntervalSince1970: longTime.doubleValue)
            
        }
        quantity = dict["quantity"] as! Int
        remainingQuantity = dict["remainingQuantity"] as! Int
        statusFlag = dict["statusFlag"] as! Int
        unit = dict["unit"] as! String
        
        
    }
    

}
