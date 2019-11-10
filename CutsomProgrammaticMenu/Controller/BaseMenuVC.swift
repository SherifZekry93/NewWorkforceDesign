//
//  ViewController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/19/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import RevealingSplashView
class BaseMenuVC:UIViewController
{
    let backgroundMenuView:UIView = UIView()
    
    let darkFillView:UIView = UIView()
    
    let Close:UIButton = UIButton()
    
    let menu:UIButton = UIButton()
    
    var topConatraint: NSLayoutConstraint!
    
    var  MenuButtonTop: NSLayoutConstraint!
    
    var menuButtons:UIStackView = UIStackView()
    
    let vacatioonButton:UIButton = UIButton()
    
    let permissionButton:UIButton = UIButton()
    let pendingButton:UIButton = UIButton()
    let anothervacatioonButton:UIButton = UIButton()
    
    let anotherpermissionButton:UIButton = UIButton()
    
    let anotherpendingButton:UIButton = UIButton()
    
    let anotheranothervacatioonButton:UIButton = UIButton()
    
    let anotheranotherpermissionButton:UIButton = UIButton()
    
    let anotheranotherpendingButton:UIButton = UIButton()
    
//    var baseView = UIView()
    
    let revealingSplace = RevealingSplashView(iconImage: #imageLiteral(resourceName: "logo"), iconInitialSize: CGSize(width: 122, height: 122), backgroundColor: .lightGray)
    
    lazy var dashboardOpenerView:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "menuHomeIcon"), text: "Dashboard".localized(), tag: 2000)
        return v
    }()
    
    lazy var calendarOpenerView:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "menuCalendar"), text: "calendar".localized(), tag: 2001)
        return v
    }()
    
    lazy var requestsOpenerView:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "RequestsMenu"), text: "Requests".localized(), tag: 2002)
        return v
    }()
    
    lazy var attendanceOpener:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "menuAttendance"), text: "Attendance".localized(), tag: 2003)
        return v
    }()
    
    lazy var checkInOpener:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "MenuCheckin"), text: userDefaults.bool(forKey: IS_CHECKED_IN) == false ? "Check in".localized() : "Check out".localized(), tag: 2004)
        return v
    }()
    
    lazy var settingsOpener:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "MenuSettings"), text:"Settings".localized(), tag: 2005)
        return v
    }()
    
    
    lazy var aboutButton:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "MenuAbout"), text: "About".localized(), tag: 2006)
        return v
    }()
    
    lazy var logOutButton:UIView = {
        let v = getWhiteTransparentView(icon: #imageLiteral(resourceName: "MenuLogOut"), text: "Logout".localized(), tag: 2007)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupViews()
        if UserDefaults.standard.value(forKey: "AnimationDoneLoading") as? Bool == false || UserDefaults.standard.value(forKey: "AnimationDoneLoading") == nil
        {
            view.addSubview(revealingSplace)
            revealingSplace.animationType = .rotateOut
            revealingSplace.startAnimation()
            UserDefaults.standard.set(true, forKey: "AnimationDoneLoading")
        }

    }
    
//    @objc func showThird()
//    {
//        navigationController?.pushViewController(ThirdVC(), animated: true)
//    }
//
//    @objc func showFourth()
//    {
//        navigationController?.pushViewController(FourthVC(), animated: true)
//    }
    
    fileprivate func setupViews()
    {
        backgroundMenuView.alpha = 0
        
        Close.setImage(#imageLiteral(resourceName: "ic_clear_24px"), for: .normal)
        
        Close.backgroundColor = .orange
        
        view.addSubview(darkFillView)
        
        view.addSubview(backgroundMenuView)
        
        backgroundMenuView.fillSuperView()
        
        backgroundMenuView.backgroundColor = .clear
        
        vacatioonButton.setImage(#imageLiteral(resourceName: "Status-On"), for: .normal)
        
        permissionButton.setImage(#imageLiteral(resourceName: "Rewards-On"), for: .normal)
        
        pendingButton.setImage(#imageLiteral(resourceName: "Calendar-Off"), for: .normal)
        
        anothervacatioonButton.setImage(#imageLiteral(resourceName: "Deals-Off"), for: .normal)
        
        anotherpermissionButton.setImage(#imageLiteral(resourceName: "Messenger-On"), for: .normal)
        
        anotherpendingButton.setImage(#imageLiteral(resourceName: "Rewards-Off"), for: .normal)
        
        anotheranothervacatioonButton.setImage(#imageLiteral(resourceName: "Deals-Off"), for: .normal)
        
        anotheranotherpermissionButton.setImage(#imageLiteral(resourceName: "Messenger-On"), for: .normal)
        
        anotheranotherpendingButton.setImage(#imageLiteral(resourceName: "Rewards-Off"), for: .normal)
        
        menu.setImage(#imageLiteral(resourceName: "ic_apps_24px"), for: .normal)
        
        menu.backgroundColor = .orange
        
        menu.layer.cornerRadius = 25
        
        menu.clipsToBounds = true
        
        view.addSubview(menu)
        
        menu.anchorToView(top: nil, leading: nil, bottom: backgroundMenuView.bottomAnchor, trailing: backgroundMenuView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .init(width: 50, height: 50))
        
        menuButtons =  UIStackView(arrangedSubViews: [
            
            UIStackView(arrangedSubviews: [dashboardOpenerView,UIView(),calendarOpenerView]),
            
            UIStackView(arrangedSubviews: [requestsOpenerView,UIView(),attendanceOpener]),
            
            UIStackView(arrangedSubviews: [checkInOpener,UIView(),settingsOpener]),
            
            UIStackView(arrangedSubviews: [aboutButton,UIView(),logOutButton])
            ], axis: .vertical, spacing: 0)
        menuButtons.distribution = .equalSpacing
        backgroundMenuView.addSubview(menuButtons)
        menuButtons.anchorToView(trailing: nil,size:.init(width: 270, height: 500),centerH:true)
        MenuButtonTop = menuButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor)// menuButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        MenuButtonTop.constant = -50
        MenuButtonTop.isActive = true
        menu.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        view.addSubview(Close)
        Close.anchorToView(top: nil, leading: nil, bottom: backgroundMenuView.bottomAnchor, trailing: backgroundMenuView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .init(width: 50, height: 50))
        Close.layer.cornerRadius = 25
        Close.clipsToBounds = true
        Close.alpha = 0
        Close.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        darkFillView.alpha = 0
        menuButtons.alpha = 0
    }
    @objc func openMenu()
    {
        menuClicked()
    }
    @objc func closeMenu()
    {
        close()
    }
    override func viewDidLayoutSubviews() {
        darkFillView.anchorToView(size:.init(width: 42, height: 42), centerH: true, centerV: true)//frame = CGRect(x: menu.frame.origin.x + 15 , y: menu.frame.origin.y + 15, width: 42, height: 42)
        darkFillView.backgroundColor = UIColor(red: 54/255, green: 56/255, blue: 71/255, alpha: 0.85)//.black
        darkFillView.layer.cornerRadius = 21
    }
    
    fileprivate func menuClicked()
    {
        backgroundMenuView.alpha = 1
        MenuButtonTop.constant = 0//(view.frame.height / 2) - (476 / 2)
        self.menu.isHidden = true
        if darkFillView.transform == CGAffineTransform.identity
        {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                self.darkFillView.alpha = 1
                self.darkFillView.transform = CGAffineTransform(scaleX: 90, y: 90)
                self.menuButtons.alpha = 1
            })
        }
        UIView.animate(withDuration: 0.5) {
            self.Close.alpha = 1
            self.menu.alpha = 0
        }
    }
    fileprivate func close()
    {
        
        self.menu.isHidden = false
        
        self.menu.center = self.Close.center
        
        UIView.animate(withDuration: 0.5) {
            self.Close.alpha = 0
            self.menu.alpha = 1
            self.menuButtons.alpha = 0
            self.MenuButtonTop.constant = -50
            self.view.layoutIfNeeded()
            self.Close.isHidden = false
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.darkFillView.alpha = 0
            self.darkFillView.transform = .identity
        }) { (_) in
            self.backgroundMenuView.alpha = 0
        }
        
    }
    
    fileprivate func getWhiteTransparentView(icon:UIImage,text:String,tag:Int) -> UIView
    {
        let whiteTransparentView = UIView()
        whiteTransparentView.tag = tag
        whiteTransparentView.layer.cornerRadius = 8
        
        whiteTransparentView.clipsToBounds = true
        
        whiteTransparentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.20)
        
        whiteTransparentView.anchorToView(size:.init(width: 110, height: 110))
        
        let iconImage = UIImageView()
        
        iconImage.anchorToView(size:.init(width: 32.98, height: 32.98))
        
        iconImage.image = icon
        
        let iconNameLabel = UILabel()
        
        iconNameLabel.text = text
        
        iconNameLabel.textColor = .white
        
        let iconsStack = UIStackView(arrangedSubViews: [
            UIView(),
            iconImage,
            iconNameLabel,
            UIView()
            ], axis: .vertical, spacing: 0)
        iconsStack.alignment = .center
        iconsStack.distribution = .equalCentering
        whiteTransparentView.addSubview(iconsStack)
        iconsStack.fillSuperView()
        whiteTransparentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToController)))
        return whiteTransparentView
    }
    @objc func goToController(_ sender:UITapGestureRecognizer)
    {
        if let tag = sender.view?.tag
        {
            switch tag {
            case 2000:
                self.navigationController?.pushViewController(DashboardVC(), animated: true)
            case 2001:
                navigationController?.pushViewController(CalendarVC(), animated: true)
            case 2002:
                print("Requests")
            case 2003:
                print("Attendance")
            case 2004:
                closeMenu()
                navigationController?.pushViewController(CheckinVC(), animated: true)
            case 2005:
                closeMenu()
                let setting = SettingsVC()
                setting.modalPresentationStyle = .fullScreen
                setting.closeButton.isHidden = false
                present(UINavigationController(rootViewController: setting), animated: true, completion: nil)
            case 2006:
                closeMenu()
                navigationController?.pushViewController(AboutVC(), animated: true)
            case 2007:
                closeMenu()
                User.removeSavedUser()
                let _  = Authenticate()
                closeMenu()
            default:
                print("Some other character")
            }
        }
    }
}
