//
//  FeedOutput.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 25.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol FeedOutput {
    var configuration: FeedConfiguration? { get }
    var buttonTaped: ((String) -> Void)? { get }
}
