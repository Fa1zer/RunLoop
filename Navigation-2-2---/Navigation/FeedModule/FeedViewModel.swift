//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 25.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class FeedViewModel: FeedOutput, FeedInput, Coordinatable {
    let model = FeedModel()
    
    weak var tabBar: TabBarController?
    var callTabBar: (() -> Void)?
    
    var configuration: FeedConfiguration? {
        didSet {
            onDataChanged?(configuration!)
        }
    }

    
    var onDataChanged: ((FeedConfiguration) -> Void)? {
        return { config in
            switch self.configuration {
            case .green:
                NotificationCenter.default.post(name: NSNotification.Name("green"), object: nil)
            case .red:
                NotificationCenter.default.post(name: NSNotification.Name("red"), object: nil)
            default:
                break
            }
        }
    }
    
    var buttonTaped: ((String) -> Void)? {
        return { word in
            self.model.check(word: word, configuration: &self.configuration)
        }
    }
}
