//
//  NavigationController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 03.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FirstNavigationController: UINavigationController, Coordinatable {
    var tabBar: TabBarController?
    var callTabBar: (() -> Void)?    
    
    private let createModuleFactory = CreateModuleFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createModuleFactory.createModule(navigatinController: self)
        
        tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"),
                                  selectedImage: UIImage(systemName: "house.fill"))
        
        title = "Feed"
    }
}
