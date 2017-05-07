//
//  AppTabBarController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeController(nibName: "HomeController", bundle: nil)
        let navHome = UINavigationController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_selected"))
        
        self.tabBar.backgroundColor = .white
        self.tabBar.itemPositioning = .centered
        centerIcon(tabBarItem: navHome.tabBarItem)
        
        let cart = CartController.shared
        let navCart = UINavigationController(rootViewController: cart)
        navCart.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "profile"), selectedImage:#imageLiteral(resourceName: "profile_selected"))
        navCart.setNavigationBarHidden(true, animated: false)
        centerIcon(tabBarItem: navCart.tabBarItem)
        
        self.viewControllers = [navHome,navCart]
        
//        var tabbarFrame = tabBar.frame
//        tabbarFrame.size.height = 40
//        tabbarFrame.origin.y = self.tabBar.frame.origin.y + (tabBar.frame.size.height - 40)
//        tabBar.frame = tabbarFrame
//        tabBar.backgroundColor = .white
        
        
        
        
  
    }
    
    func centerIcon(tabBarItem : UITabBarItem)
    {
        var navHomeImageInsets = tabBarItem.imageInsets
        navHomeImageInsets.bottom = -6.0
        navHomeImageInsets.top = 6.0
        tabBarItem.imageInsets = navHomeImageInsets
    }


}



