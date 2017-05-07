//
//  AppDelegate.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/23/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import FacebookCore
import FBSDKCoreKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        setRootViewControllerForWindow(animated: false)
        UITabBar.appearance().shadowImage = #imageLiteral(resourceName: "TransparentPixel")
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
        self.window?.makeKeyAndVisible()
        
        return true
    }
    /**
     - paramter animated : true or false animted transition
     # func do:
     1. check whether user is logged
     2. consider which is root controller
     
     */
    
    func setRootViewControllerForWindow(animated : Bool)
    {
        let timeInterval : TimeInterval  = animated ? 0.2 : 0
        
        if API.shared.isHasloginToken()
        {
            let token : String = API.shared.userDefaults.value(forKey: AppKey.udToken) as! String
            API.shared.headerAuth = ["Authorization" : AppString.accessTokenPrefix + token]
            if animated {
                let transition = CATransition()
                transition.duration = timeInterval
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromRight
                window?.backgroundColor = .white
                window?.layer.add(transition, forKey: kCATransition)
                self.window?.rootViewController = AppTabBarController()
                return
            }
            self.window?.rootViewController = AppTabBarController()
            return
            
        }
        self.window?.rootViewController = LoginController(nibName: "LoginController", bundle: nil)
        
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handled
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
        AppEventsLogger.activate(application)
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

