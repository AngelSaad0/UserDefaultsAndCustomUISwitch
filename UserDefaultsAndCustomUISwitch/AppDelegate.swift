//
//  AppDelegate.swift
//  UserDefaultInSwift
//
//  Created by Engy on 7/31/2567 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        var vc: UIViewController
        if UserDefaultManager.shared.continueAsAGuest  {
            vc = storyboard.instantiateViewController(identifier: "2") as! SecondVC
        } else if UserDefaultManager.shared.islogin {
            vc = storyboard.instantiateViewController(identifier: "1") as! FirstVC
        } else {
            vc = storyboard.instantiateViewController(identifier: "0") as! ViewController
        }
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        return true
    }



}

