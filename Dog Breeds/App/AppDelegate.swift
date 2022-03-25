//
//  AppDelegate.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 21-03-22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DogBreedsViewController().configurator()
        window?.makeKeyAndVisible()
        
        return true
    }
}
