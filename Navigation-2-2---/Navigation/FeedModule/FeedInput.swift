//
//  FeedInput.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 25.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol FeedInput {
    var onDataChanged: ((FeedConfiguration) -> Void)? { get }
}
