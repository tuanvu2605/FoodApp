//
//  BaseController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class BaseController: UIViewController {
    var initScrollCount : Int = 3
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initScrollCount = 3
        
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
        let tabbarFrame = self.tabBarController?.tabBar.frame
        
        guard let frame = tabbarFrame else {
            return
        }
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        let time : TimeInterval = animated ? 0.3 : 0.0
        UIView.animate(withDuration: time) {
            
            self.tabBarController?.tabBar.frame = (frame.offsetBy(dx: 0, dy: offsetY))
        }
        
        
        
    }
    
    func tabBarIsVisible() -> Bool
    {
        if self.tabBarController == nil
        {
            return false
        }
        
        return (self.tabBarController?.tabBar.frame.origin.y)! < AppSize.screenHeight
    }
    

    
    
    
}

