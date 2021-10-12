//
//  Coordinatable.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 23.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol Coordinatable {
    var tabBar: TabBarController? { get set }
    var callTabBar: (() -> Void)? { get set }
}
