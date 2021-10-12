//
//  LogInInspector.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 31.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LogInViewControllerDelegate {
    
    func inspect(emailOrPhone: String, password: String) -> Bool
}

class LogInInspector: LogInViewControllerDelegate {
    func inspect(emailOrPhone: String, password: String) -> Bool {
        return Checker.checker.check(emailOrPhone: emailOrPhone, password: password)
    }
}
