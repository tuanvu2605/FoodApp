//
//  StoreOrderController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/10/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import CarbonKit

class StoreOrderController: UIViewController {
    
    static let shared = StoreOrderController(nibName: "StoreOrderController", bundle: nil)
    var  carbonSwipeNavigation : CarbonTabSwipeNavigation!
    let items = ["Tất cả" , "Hiện tại" , "Lịch sử"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        carbonSwipeNavigation = CarbonTabSwipeNavigation(items : items , delegate : self)
        carbonSwipeNavigation.setTabExtraWidth(5.0)
        carbonSwipeNavigation.setIndicatorColor(.red)
        carbonSwipeNavigation.setSelectedColor(.red)
        carbonSwipeNavigation.setNormalColor(.black)
        print("before change \(self.view.frame)")
        var frame = self.view.frame
        frame.origin.y += 20
        let contentView = UIView(frame: frame)
        self.view.addSubview(contentView)
        print("after change \(self.view.frame)")
        carbonSwipeNavigation.insert(intoRootViewController: self, andTargetView: contentView)
//        carbonSwipeNavigation.toolbar.setShadowImage(#imageLiteral(resourceName: "TransparentPixel"), forToolbarPosition: .any)
        carbonSwipeNavigation.toolbar.setBackgroundImage(#imageLiteral(resourceName: "Pixel"), forToolbarPosition: .any, barMetrics: .default)
        
        let segmentCount : Int = (carbonSwipeNavigation.carbonSegmentedControl?.segments?.count)!
        for i in 0..<segmentCount {
          
            carbonSwipeNavigation.carbonSegmentedControl?.setWidth(AppSize.screenWidth/3, forSegmentAt: i)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension StoreOrderController : CarbonTabSwipeNavigationDelegate
{
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let controller = HistoryOrderController()
        controller.didSelectedCell = ({(listProdct) in
            
            let lastOrderController = LastOrderController(nibName: "LastOrderController", bundle: nil)
            lastOrderController.listItem = listProdct
            self.navigationController?.pushViewController(lastOrderController, animated: true)
            
            
        })
        
        return controller
    }
}
