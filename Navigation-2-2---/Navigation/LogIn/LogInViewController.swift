//
//  LogInViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 07.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, Coordinatable {
    
    var callTabBar: (() -> Void)?
    weak var tabBar: TabBarController?
    var delegate: LogInViewControllerDelegate?
    
    private let color = UIColor(patternImage: UIImage(named: "blue_pixel")!)
    
    private lazy var logInButton: CustomButton = {
       let button = CustomButton(title: "Log In",
                                 color: color,
                                 target: { [weak self] in self?.tapButton() })
        
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let vkLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let containerView: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    internal let usersEmailOrPhone: UITextField = {
       let emailOrPhone = UITextField()
        
        emailOrPhone.tintColor = #colorLiteral(red: 0.3675304651, green: 0.5806378722, blue: 0.7843242884, alpha: 1)
        emailOrPhone.textColor = .black
        emailOrPhone.font = UIFont.systemFont(ofSize: 16)
        emailOrPhone.autocapitalizationType = .none
        emailOrPhone.backgroundColor = .systemGray6
        emailOrPhone.placeholder = "Email or phone"
        emailOrPhone.layer.cornerRadius = 10
        emailOrPhone.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        emailOrPhone.layer.borderColor = UIColor.lightGray.cgColor
        emailOrPhone.layer.borderWidth = 0.5
        emailOrPhone.translatesAutoresizingMaskIntoConstraints = false
        emailOrPhone.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        emailOrPhone.leftViewMode = .always
        emailOrPhone.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        emailOrPhone.rightViewMode = .always
        
        return emailOrPhone
    }()
    
    internal let usersPassword: UITextField = {
       let password = UITextField()
        
        password.tintColor = #colorLiteral(red: 0.3675304651, green: 0.5806378722, blue: 0.7843242884, alpha: 1)
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.backgroundColor = .systemGray6
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.translatesAutoresizingMaskIntoConstraints = false
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        password.leftViewMode = .always
        password.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        password.rightViewMode = .always
        
        return password
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        setupViews()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboadWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(vkLogo)
        view.addSubview(usersEmailOrPhone)
        view.addSubview(usersPassword)
        view.addSubview(logInButton)
        
        scrollView.addSubview(containerView)
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor),

            vkLogo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vkLogo.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor,
                                        constant: 120),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
        
            usersEmailOrPhone.leadingAnchor.constraint(equalTo:
                                                        containerView.safeAreaLayoutGuide.leadingAnchor,
                                                       constant: 16),
            usersEmailOrPhone.trailingAnchor.constraint(equalTo:
                                                    containerView.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -16),
            usersEmailOrPhone.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            usersEmailOrPhone.heightAnchor.constraint(equalToConstant: 50),
            
            usersPassword.leadingAnchor.constraint(equalTo:
                                                    containerView.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: 16),
            usersPassword.trailingAnchor.constraint(equalTo:
                                                    containerView.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -16),
            usersPassword.topAnchor.constraint(equalTo: usersEmailOrPhone.bottomAnchor, constant: -0.5),
            usersPassword.heightAnchor.constraint(equalTo: usersEmailOrPhone.heightAnchor),
            
            logInButton.topAnchor.constraint(equalTo: usersPassword.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo:
                                                    containerView.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 16),
            logInButton.trailingAnchor.constraint(equalTo:
                                                    containerView.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func keyboadWillShow(notification: NSNotification) {
        if let keyboardSize =
            (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0,
                                                                    bottom: keyboardSize.height,
                                                                    right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func tapButton() {
        
        if delegate?.inspect(emailOrPhone: usersEmailOrPhone.text!,
                             password: usersPassword.text!) == true {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        } else {
            
            let alertController = UIAlertController(title: "Неправильно введен логин или пароль",
                                        message: "Попробуйте ввести заново",
                                        preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "ОК", style: .default)
            
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
