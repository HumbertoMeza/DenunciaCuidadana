//
//  AppDelegate.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 31/10/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit
import GoogleMaps
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAKt_se1bTXJ3QR82tS7N3ZWYfY0SaJLXo")
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: "aidi2")

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
  
    

}

