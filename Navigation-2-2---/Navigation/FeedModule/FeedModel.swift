//
//  FeedViewControllerModel.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 03.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class FeedModel {    
    private let password = "Password"
        
    func check(word: String, configuration: inout FeedConfiguration?){
        if word == password {
            configuration = .green
        } else {
            configuration = .red
        }
    }
}
