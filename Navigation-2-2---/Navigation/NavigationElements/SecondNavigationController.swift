//
//  SecondNavigationController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 05.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class SecondNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [LogInViewController()]
        
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"),
                                  selectedImage: UIImage(systemName: "person.fill"))
        
        title = "Profile"
    }
}
