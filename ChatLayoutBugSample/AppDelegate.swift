//
//  AppDelegate.swift
//  ChatLayoutBugSample
//
//  Created by Ilya Kharlamov on 10/4/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = SampleController()
        self.window?.makeKeyAndVisible()
        return true
    }
    
}
