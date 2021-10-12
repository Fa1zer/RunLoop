//
//  CreateModuleFactory.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 23.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class CreateModuleFactory {
    func createModule(navigatinController: FirstNavigationController) {
        let viewModel = FeedViewModel()
        
        let viewController = FeedViewController(viewModel: viewModel)
        
        navigatinController.pushViewController(viewController, animated: true)
    }
}
