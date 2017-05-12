//
//  NavController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/8/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class NavController: ScrollingNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = #imageLiteral(resourceName: "TransparentPixel")
//        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Pixel"), for: .default)
        navigationBar.barTintColor = UIColor("8dc33b")


        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
