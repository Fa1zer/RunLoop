//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController, Coordinatable {
    
    var callTabBar: (() -> Void)?
    weak var tabBar: TabBarController?

    private lazy var button: CustomButton = { [weak self] in
        let button = CustomButton(title: "Tap me",
                                  color: .clear,
                                  target: self!.showAlert)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(button)
        
        button.snp.makeConstraints({ make in
            make.center.equalToSuperview()
        })
    }
    
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Удалить пост?",
                                    message: "Пост нельзя будет восстановить",
                                    preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            
            print("Отмена")
        }
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            
            print("Удалить")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
