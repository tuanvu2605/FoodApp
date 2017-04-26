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
        self.viewControllers = [navHome]
        self.tabBar.backgroundColor = .white
        self.tabBar.itemPositioning = .centered
        var tabbarFrame = tabBar.frame
        tabbarFrame.size.height = 40
        tabbarFrame.origin.y = self.tabBar.frame.origin.y + (tabBar.frame.size.height - 40)
        tabBar.frame = tabbarFrame
        tabBar.backgroundColor = .white
        
        
  
    }


}

extension BaseController : UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0 {
            
            setTabBarVisible(visible: true, animated: true)
        }else
        {

            if initScrollCount > 0 {
                initScrollCount -= 1
                return
            }
            setTabBarVisible(visible: false, animated: true)
        }
    }
    
    func setTabBarVisible(visible : Bool , animated : Bool)
    {
        if visible == tabBarIsVisible() { return }
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        let time : TimeInterval = animated ? 0.3 : 0.0
        
        UIView.animate(withDuration: time) {
            
            self.tabBarController?.tabBar.frame = (frame?.offsetBy(dx: 0, dy: offsetY!))!
        }
        
        
        
    }
    
    func tabBarIsVisible() -> Bool
    {
        return (self.tabBarController?.tabBar.frame.origin.y)! < self.view.frame.maxY
    }
    

}

