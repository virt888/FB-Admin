/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	Application delegate.
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().tintColor = UIColor.white
      let loginVC = LoginController()
      let navigationVC = NavigationController(rootViewController: loginVC)
UIApplication.shared.windows.first?.rootViewController = navigationVC
    
        /*
         let userName = UserDefaultsUtils.getUserName()
         let password = UserDefaultsUtils.getPassword()
         
         if userName != nil && password != nil {in
         let unlockVC = UnLockViewController()
         UIApplication.shared.windows.first?.rootViewController = unlockVC
         } else {
         let loginVC = LoginViewController()
         UIApplication.shared.windows.first?.rootViewController = loginVC
         }
         */
        return true
    }
}
