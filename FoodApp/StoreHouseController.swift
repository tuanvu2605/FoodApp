//
//  StoreHouseController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import CarbonKit
import AMScrollingNavbar

class StoreHouseController: UIViewController {
    
    
    var categories : [Category]!
    var tabIndex : Int!
    {
        didSet
        {
            if carbonSwipeNavigation != nil
            {
                carbonSwipeNavigation.setCurrentTabIndex(UInt(tabIndex), withAnimation: false)
            }
        }
    }
    var  carbonSwipeNavigation : CarbonTabSwipeNavigation!
    static let  shared = StoreHouseController()
    var refCollection : UICollectionView?
    {
        didSet
        {
            registerFollowCollection()
        }
        
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let cartView = CartBarItem.shared
        let cartItem = UIBarButtonItem(customView:cartView)
        cartItem.tintColor = .black
        navigationItem.rightBarButtonItem = cartItem
//        let ges = UITapGestureRecognizer(target: self, action: #selector(btnCartDidTap))
//        cartView.addGestureRecognizer(ges)
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        let items = categories.map({ (cate : Category) -> String in
        
                let result = cate.categoryName
                return result
        })
        
        self.edgesForExtendedLayout = UIRectEdge.bottom
        carbonSwipeNavigation = CarbonTabSwipeNavigation(items : items , delegate : self)
        carbonSwipeNavigation.setTabExtraWidth(5.0)
        carbonSwipeNavigation.setIndicatorColor(.red)
        carbonSwipeNavigation.setSelectedColor(.red)
        carbonSwipeNavigation.setNormalColor(.black)
        carbonSwipeNavigation.insert(intoRootViewController: self, andTargetView: self.view)
        carbonSwipeNavigation.toolbar.setShadowImage(#imageLiteral(resourceName: "TransparentPixel"), forToolbarPosition: .any)
        carbonSwipeNavigation.toolbar.setBackgroundImage(#imageLiteral(resourceName: "Pixel"), forToolbarPosition: .any, barMetrics: .default)
   
        let segmentCount : Int = (carbonSwipeNavigation.carbonSegmentedControl?.segments?.count)!
        for i in 0..<segmentCount {
            carbonSwipeNavigation.carbonSegmentedControl?.getWidthForSegment(at: UInt(i))
            if i < 90
            {
                carbonSwipeNavigation.carbonSegmentedControl?.setWidth(90, forSegmentAt: i)
            }
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "leftArrowGrey"), style: .done, target: self, action: #selector(backButtonDidTap(_:)))
        carbonSwipeNavigation.setCurrentTabIndex(UInt(tabIndex), withAnimation: false)
        
        

        
    }
    
    
    
//    func btnCartDidTap() {
//        
//        let cart = CartController.shared
//        let navCart = NavController(rootViewController: cart)
//        present(navCart, animated: false, completion: nil)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.showNavbar(animated: true)
        }

    }
    
    func registerFollowCollection()
    {
        if let navigationController = super.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(refCollection!, delay: 50.0)
        }
    }
}

extension StoreHouseController : CarbonTabSwipeNavigationDelegate
{
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let controller = ProductsController(nibName: "ProductsController", bundle: nil)
        controller.category = categories[Int(index)]
        controller.didSetCollection = {() in
            
            
            
        }
        return controller
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        
        let controller = carbonTabSwipeNavigation.pageViewController.viewControllers?[0] as! ProductsController
        self.refCollection = controller.collection
     }
    
    func backButtonDidTap(_ sender : UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UISegmentedControl
{
    
}
