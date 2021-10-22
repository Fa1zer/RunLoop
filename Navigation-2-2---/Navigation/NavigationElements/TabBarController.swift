//
//  TapBarController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 05.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let profileViewController = ProfileViewController()
    private let logInViewController = LogInViewController()
    private let photosViewController = PhotosViewController()
    private let postViewController = PostViewController()
    private let infoViewController = InfoViewController()
    private let feedModule = FeedViewModel()
    private let firstNavigationController = FirstNavigationController()
    private let secondNavigationController = SecondNavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileViewController.tabBar = self
        logInViewController.tabBar = self
        photosViewController.tabBar = self
        postViewController.tabBar = self
        infoViewController.tabBar = self
        feedModule.tabBar = self
        firstNavigationController.tabBar = self
        secondNavigationController.tabBar = self

        let controllers = [firstNavigationController, secondNavigationController]
        
        viewControllers = controllers
        
        selectedIndex = 1
        selectedIndex = 0
    }
}
