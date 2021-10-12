//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = TabBarController()
        
               self.window?.rootViewController = tabBar
               window?.makeKeyAndVisible()
               window?.windowScene = windowScene
            
        guard let _ = (scene as? UIWindowScene) else { return }
                
        if let tabController = window?.rootViewController as? UITabBarController,
            let loginNavigation = tabController.viewControllers?.last as? UINavigationController,
            let loginController = loginNavigation.viewControllers.first as? LogInViewController {
            
            let myLogInFactory = MyLoginFactory()
            
            loginController.delegate = myLogInFactory.createInspector()
        }
    }
}

