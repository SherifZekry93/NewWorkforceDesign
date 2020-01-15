//
//  AppDelegate.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/19/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import MOLH
import IQKeyboardManager
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable {
    
    func reset()
    {
        window?.rootViewController = UINavigationController(rootViewController:  DashboardVC())
    }
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyAnKvay92-zyf4Or37UL6tsEF7BL8PiC6U")
        
        GMSPlacesClient.provideAPIKey("AIzaSyAnKvay92-zyf4Or37UL6tsEF7BL8PiC6U")

        IQKeyboardManager.shared().isEnabled = true
        
        MOLH.shared.activate(true)
        
        window?.rootViewController = UINavigationController(rootViewController: DashboardVC())

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UserDefaults.standard.set(false, forKey: "AnimationDoneLoading")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.setValue(false, forKey: "AnimationDoneLoading")
    }
    
}

