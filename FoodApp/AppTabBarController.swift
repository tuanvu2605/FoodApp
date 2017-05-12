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
        let navHome = NavController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_selected"))
        
        self.tabBar.backgroundColor = .white
        self.tabBar.itemPositioning = .centered
        centerIcon(tabBarItem: navHome.tabBarItem)
        
        let history = StoreOrderController.shared
        let navHistory = NavController(rootViewController: history)
        navHistory.tabBarItem = UITabBarItem(title: nil, image:#imageLiteral(resourceName: "clock"), selectedImage: nil)
        navHistory.setNavigationBarHidden(true, animated: false)
        centerIcon(tabBarItem: navHistory.tabBarItem)
    
        self.viewControllers = [navHome ,navHistory]
        
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



