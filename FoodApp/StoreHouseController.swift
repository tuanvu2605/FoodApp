//
//  StoreHouseController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import CarbonKit

class StoreHouseController: BaseController {
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        let items = categories.map({ (cate : Category) -> String in
        
                let result = cate.categoryName
                return result
        })
        
//        self.automaticallyAdjustsScrollViewInsets = false
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.extendedLayoutIncludesOpaqueBars = true
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
       
    }



}

extension StoreHouseController : CarbonTabSwipeNavigationDelegate
{
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let controller = ProductsController(nibName: "ProductsController", bundle: nil)
        controller.category = categories[Int(index)]
        return controller
    }
    
    func backButtonDidTap(_ sender : UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UISegmentedControl
{
    
}
