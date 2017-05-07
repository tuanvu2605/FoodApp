//
//  Utils.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/27/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    /**
     

     - parameter text : string you would convert to dictionary
     - returns : dictionary with key type is String , value type is String
     
     */
    
    static func convertStringToDict(text : String) -> [String : String]?
    {
        if let data = text.data(using: .utf8)
        {
            do {
                 return  try JSONSerialization.jsonObject(with: data, options: []) as? [String : String]
            } catch  {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
    static func gradient( view : UIView , alphaStart : CGFloat , alphaEnd : CGFloat , colorStart : UIColor , colorEnd : UIColor)
    {
        let gradient  = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [colorStart.withAlphaComponent(alphaStart).cgColor , colorEnd.withAlphaComponent(alphaEnd).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0);
        gradient.endPoint = CGPoint(x: 0, y: 1);
        view.layer.insertSublayer(gradient, at: 1)
    }

    static func formatNumberCurrency(_ number : NSNumber) -> String
    {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        return  fmt.string(from: number)!
    }
}
