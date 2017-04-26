//
//  HiFb.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import HexColors
import FontAwesomeKit


class HiFb: NSObject {
    
  
    static let sharedInstance = HiFb()
   
    
    override init() {
        
       
     
    }
    
    init(controller : UIViewController) {
        
     
    }
    
    
    static func configLoginButton(_ button  : UIButton)
    {
        
       
        button.setTitle(AppTitle.loginFacebook, for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = UIColor("3b5998")
        button.titleLabel?.textColor = .white
        let buttonIcon = FAKFontAwesome.facebookIcon(withSize: 30)
        buttonIcon?.addAttributes([NSForegroundColorAttributeName : UIColor.white])
        let buttonIconImg = buttonIcon?.image(with: CGSize(width: 30, height: 30))
        button.setImage(buttonIconImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
    }
    
    
     func loginFacebook(_ controller : UIViewController)
    {
        let loginManager = LoginManager()
        
        loginManager.logIn([ .publicProfile , .email], viewController: controller) { loginResult in
            
            switch loginResult {
                
            case .failed(let error):
                
                print(error)
                
            case .cancelled:
                
                print("User cancelled login.")
                
            case .success(_, _, let accessToken):
                
                print("Logged in! \(accessToken.userId!)")
                
            }
            
        }

    }
    
    
    
    
    
    

}
