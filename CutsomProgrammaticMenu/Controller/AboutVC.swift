//
//  AboutVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/3/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
//import SwiftUI
class AboutVC:UIViewController
{
    let topGradientBG:UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        return v;
    }()
    
    let backButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_arrow_back_left_24px"), for: .normal)
        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return button
    }()
    
    
    let aboutLabel:UILabel = {
        let label = UILabel()
        label.text = "About ASIS"
        label.textColor = .white
        label.font = UIFont(name: "Cairo-Regular", size: 22)
        return label
    }()
    
    let textContainerView:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        v.dropShadow()
        return v
    }()
    let aboutASISLabel:UILabel = {
        let label = UILabel()
      
    
        let attributedString = NSMutableAttributedString(string:

        """
        Advanced Solutions for Information Systems (ASIS) was founded in Doha Qatar last 2001. ASIS is fully committed to being the leading provider of advanced technology and information systems. We are also one of the leading pioneer software houses specialized in developing information systems and consultation services related to information technology and computer sciences.
        Our unquenchable partial for quality has led us to getting prestigious clients and keeping our growth at a very high rate. With our in depth expertise in developing solutions, spanning diverse technologies, Now ASIS aims to propel its courses on to the high growth of offering total solutions and world class Solutions.
        """


        )

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 8 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        label.attributedText = attributedString

        label.numberOfLines = -1
        
        label.textColor = .aboutTextColor
        
        label.textAlignment = .center
//        label.backgroundColor = .red
        return label
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .permissionBGColor
        setupViews()
    }
    
    private func setupViews()
    {
        addSubview(topGradientBG)
        topGradientBG.anchorToView(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 229))
        addSubview(backButton)
        backButton.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 21, left: 21, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        addSubview(aboutLabel)
        aboutLabel.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 80, left: 21, bottom: 0, right: 0))
        addSubview(textContainerView)
        textContainerView.anchorToView(top: aboutLabel.bottomAnchor, leading: aboutLabel.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 20, right: 21))
        textContainerView.addSubview(aboutASISLabel)//insertSubview(aboutASISLabel, aboveSubview: textContainerView)
        aboutASISLabel.anchorToView(size: .init(width:view.frame.width - 50,height:0),centerH: true, centerV: true)
    }
    
    override func viewDidLayoutSubviews() {
        setupGradient()
        textContainerView.dropShadow(color: .black, opacity: 0.1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        topGradientBG.roundCorners([.bottomRight, .bottomLeft], radius: 30)
    }
    
    private func setupGradient()
    {
        let gradient: CAGradientLayer = CAGradientLayer()
              gradient.colors = [UIColor(red: 248, green: 174, blue: 90).cgColor, UIColor(red: 233, green: 144, blue: 42).cgColor]
              gradient.locations = [0.0 , 1.0]
              gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
              gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
              gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
              self.topGradientBG.layer.insertSublayer(gradient, at: 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @objc func dismissController()
    {
        navigationController?.popViewController(animated: true);
    }
    
}
