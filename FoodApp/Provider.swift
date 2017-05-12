//
//  Provider.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class Provider: NSObject {
    
    var address : String?
    var avatarURL : String!
    var des : String?
    var email : String!
    var firstName : String!
    var lastName : String!
    var phoneNumber : String!
    var statusFlag : Int!
    var userId : Int!
    var userUID : Int!
    var username : String!
    
    
    init(dict : [String : Any]) {
        
        address = dict["address"] as? String
        avatarURL = dict["avatarURL"] as! String
        des = dict["description"] as? String
        email = dict["email"] as! String
        firstName = dict["firstName"] as! String
        lastName = dict["lastName"] as! String
        phoneNumber = dict["phoneNumber"] as! String
        statusFlag = dict["statusFlag"] as! Int
        userId = dict["userId"] as! Int
//        userUID = dict["userUID"] as! Int
        username = dict["username"] as! String
        
    }
    

}
