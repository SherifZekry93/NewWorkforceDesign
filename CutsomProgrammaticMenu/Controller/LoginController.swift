//
//  LoginController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/8/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import ProgressHUD

class LoginController: UIViewController {
    
    let backgroundImageView:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "login-bg-image")
        return image
    }()
    
    let overLayView = OverLay()
    
    let welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Welcome".localized()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 28, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let pleaseLoginLabel:UILabel = {
        let label = UILabel()
        label.text = "Please Login To Continue".localized()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let containerView:UIView = {
        let v = UIView()
        //v.backgroundColor = .red
        v.anchorToView(size:.init(width:0,height:324))
        return v
    }()
    
    let userNameTextField:UITextField = {
        let textField = UITextField()
        textField.setAttributedPlaceHolder(text: "Username".localized())
        textField.textColor = .white
        return textField
    }()
    
    let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.setAttributedPlaceHolder(text: "Password".localized())
        //        textField.attributedPlaceholder = NSAttributedString(string: "Password",
        //                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lastGridCVColor])
        textField.textColor = .white
        return textField
    }()
    
    let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login".localized(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 251/255, green: 150/255, blue: 43/255, alpha: 1)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpViews()
        navigationController?.navigationBar.isHidden = true
        userNameTextField.localizeTextField()
        passwordTextField.localizeTextField()
    }
    let testTextField = UITextField()
    fileprivate func setUpViews()
    {
        view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperView(padding: .init(top: -15, left: -15, bottom: -15, right: -15))
        view.addSubview(overLayView)
        overLayView.fillSuperView()
        overLayView.addSubview(containerView)
        containerView.anchorToView(top: nil, leading: overLayView.leadingAnchor, bottom: nil, trailing: overLayView.trailingAnchor, padding: .init(top: 0, left: 36, bottom: 0, right: 36), centerH: nil, centerV: true)
        containerView.addSubview(welcomeLabel)
        welcomeLabel.anchorToView(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        containerView.addSubview(pleaseLoginLabel)
        pleaseLoginLabel.anchorToView(top: welcomeLabel.bottomAnchor, leading: welcomeLabel.leadingAnchor, bottom: nil, trailing: welcomeLabel.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        let userNameTextFieldView = userNameTextField.getATransparentWhiteTextField(icon: #imageLiteral(resourceName: "user"))
        view.addSubview(userNameTextFieldView)
        userNameTextFieldView.anchorToView(top: pleaseLoginLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        let passwordTextFieldView = passwordTextField.getATransparentWhiteTextField(icon: #imageLiteral(resourceName: "ic_vpn_key_24px"))
        addSubview(passwordTextFieldView)
        passwordTextFieldView.anchorToView(top: userNameTextFieldView.bottomAnchor, leading: userNameTextFieldView.leadingAnchor, bottom: nil, trailing: userNameTextFieldView.trailingAnchor, padding: .init(top: 25, left: 0, bottom: 0, right: 0))
        containerView.addSubview(loginButton)
        loginButton.anchorToView(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
    }
    @objc func performLogin()
    {
        verifyUserInputs()
    }
    
    func verifyUserInputs() {
        do {
            try verifyInput(username: userNameTextField,password: passwordTextField)
            handleLogin(username: userNameTextField.text ?? "", password: passwordTextField.text ?? "")
        }catch {
            guard let error = error as? LoginError else {
                return
            }
            showMessage(body: error.localizedDescription, theme: .error)
        }
    }
    
    func verifyInput(username: UITextField,password:UITextField) throws  {
        guard username.hasText else {
            throw LoginError.usernameEmpty
        }
        
        guard  password.hasText else {
            throw LoginError.passwordEmpty
        }
    }
    
    enum LoginError: LocalizedError {
        case usernameEmpty, passwordEmpty//, emailIsEmpty
        
        var localizedDescription: String {
            switch self {
            case .usernameEmpty:
                return "userNameEmpty".localized()
            case .passwordEmpty:
                return "passFieldEmpty".localized()
            }
        }
        
        
    }
    fileprivate func handleLogin(username:String,password:String)
    {
        ProgressHUD.show("Login")
        let finalURL = Utility.getFinalURL(methodName: "AuthenticateUser",params:[username,password])        
        Service.shared.fetchGenericJSONData(urlString: finalURL, parameters:nil) { (user:User?, err:Error?) in
            if err != nil
            {
                ProgressHUD.dismiss()
                self.showMessage(body: err!.localizedDescription, theme: .error)
            }
            else if user != nil
            {
                ProgressHUD.dismiss()
                userDefaults.set(try? PropertyListEncoder().encode(user), forKey:SAVED_USER_KEY)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
}

