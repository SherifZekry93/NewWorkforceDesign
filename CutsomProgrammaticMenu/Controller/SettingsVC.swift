//
//  SettingsVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/15/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import MOLH
class SettingsVC: UIViewController {
    
    let languageSegmentedControl:CustomSegmentedControl = {
        let segment = CustomSegmentedControl()
        segment.commaSeparatorButtonLines = "English,العربية"
        return segment
    }()
    
    let backgroundImageView:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "login-bg-image")
        return image
    }()
    
    let overLayView = OverLay()
    
    let urlTextField: UITextField = {
        let text = UITextField()
        text.textColor = .white
        text.keyboardType = UIKeyboardType.URL
        text.setAttributedPlaceHolder(text: "Base URL".localized())
        return text
    }()
    
    let selectLanguageLabel:UILabel = {
        let label = UILabel()
        label.text = "Select Language".localized()
        label.textColor = .white
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    let selectLanguageIcon:UIImageView  = {
        let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "Language-icon")
        icon.anchorToView(size:.init(width:22,height:22))
        return icon
    }()
    
    let continueButton:UIButton = {
        let button = UIButton()
        button.setTitle("Continue".localized(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 251/255, green: 150/255, blue: 43/255, alpha: 1)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(saveBaseURLAndLanguage), for: .touchUpInside)
        return button
    }()
    
    let closeButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ic_clear_24px"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingsVC()
        urlTextField.localizeTextField()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .green
        if #available(iOS 13.0, *) {
            isModalInPresentation = true
        } else {
            // Fallback on earlier versions
        }
    }
    let dummyView = UIView()
    
    fileprivate func setupSettingsVC()
    {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.fillSuperView(padding: .init(top: -15, left: -15, bottom: -15, right: -15))
        
        view.addSubview(overLayView)
        
        overLayView.fillSuperView()
        
        //        view.addSubview(dummyView)
        dummyView.anchorToView(size:.init(width: 200, height: 30))
        dummyView.backgroundColor = .white
        dummyView.addSubview(languageSegmentedControl)
        dummyView.layer.cornerRadius = 15
        dummyView.addSubview(languageSegmentedControl)
        dummyView.semanticContentAttribute = .forceLeftToRight
        languageSegmentedControl.fillSuperView(padding: .init(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5))
        
        let urlTextFieldView = urlTextField.getATransparentWhiteTextField(icon: #imageLiteral(resourceName: "ic_developer_mode_24px"))
        urlTextField.anchorToView(size: .init(width: view.frame.width - (17 * 2), height: 0))
        continueButton.anchorToView(size:.init(width: view.frame.width - (17 * 2), height: 50))
        let mainStackView = UIStackView(arrangedSubViews: [
            UIStackView(arrangedSubViews:[selectLanguageIcon,selectLanguageLabel],axis: .horizontal,spacing: 12),
            dummyView,
            urlTextFieldView,
            continueButton
            ], axis: .vertical, spacing: 24, alignment: .center)
        
        addSubview(mainStackView)
        mainStackView.anchorToView(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 17, bottom: 0, right: 17), centerH: nil, centerV: true)
        showHideButton()
    }
    func showHideButton()
    {
        overLayView.addSubview(closeButton)
        closeButton.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .init(width: 50, height: 50))//, centerH: <#T##Bool?#>, centerV: <#T##Bool?#>)
        closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    @objc func handleDismiss()
    {
        dismiss(animated: true, completion: nil)
    }
    @objc func saveBaseURLAndLanguage()
    {
        if let url = urlTextField.text,url.checkGivenUrl()
        {
            if User.getLocallySavedUser() != nil
            {
                ///alert
                
                if url == userDefaults.string(forKey: BASE_URL_KEY)
                {
                    showMessage(body: "Same url as before".localized(), theme: .warning)
                    dismiss(animated: true, completion: nil)
                    return
                }
                else
                {
                    let alert = UIAlertController(title: "warning".localized(), message: "You are logged in, if you change url you will logged out?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "No".localized(), style: .cancel, handler: {(_) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    
                    alert.addAction(UIAlertAction(title: "Yes".localized(), style: .destructive, handler: { (_) in
                        userDefaults.set(url, forKey: BASE_URL_KEY)
                        User.removeSavedUser()
                        self.navigationController?.pushViewController(LoginController(), animated: true)
                    }))
                    
                    present(alert, animated: true)
                }
            }
            else
            {
                userDefaults.set(url, forKey: BASE_URL_KEY)
                navigationController?.pushViewController(LoginController(), animated: true)
            }
        }
        else
        {
            showMessage(body: "Invalid URL".localized(), theme: .error)
        }
    }
}
