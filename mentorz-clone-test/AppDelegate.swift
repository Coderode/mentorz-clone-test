//
//  AppDelegate.swift
//  mentorz-clone-test
//
//  Created by craterzone on 20/02/21.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
        let showFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        AppDelegate.shared().window?.rootViewController = showFirstController
        AppDelegate.shared().window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle
    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    */
    class func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }

}

