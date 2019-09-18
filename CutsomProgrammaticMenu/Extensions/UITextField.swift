//
//  UITextField.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/16/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
extension UITextField
{
    func localizeTextField()
    {
        textAlignment = getAppLanguage() == "en" ? .left : .right
    }
     func getATransparentWhiteTextField(icon:UIImage) -> UIView
    {
        let whiteTransparentView = UIView()
        whiteTransparentView.layer.cornerRadius = 25
        whiteTransparentView.clipsToBounds = true
        whiteTransparentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.30)
        whiteTransparentView.anchorToView(size:.init(width: 0, height: 50))
//        self.superview?.addSubview(whiteTransparentView)
//        whiteTransparentView.anchorToView(top: someView.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor,padding: .init(top: topPadding, left: 0, bottom: 0, right: 0))
        let iconImage = UIImageView()
        iconImage.image = icon
        iconImage.contentMode = .scaleAspectFit
        iconImage.clipsToBounds = true
        iconImage.anchorToView(size:.init(width: 30, height: 30))
        whiteTransparentView.addSubview(iconImage)
        iconImage.anchorToView(top: whiteTransparentView.topAnchor, leading: whiteTransparentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 12, bottom: 0, right: 12))
        whiteTransparentView.addSubview(self)
        self.anchorToView(top: iconImage.topAnchor, leading: iconImage.trailingAnchor, bottom: iconImage.bottomAnchor, trailing: whiteTransparentView.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        return whiteTransparentView
    }
    func setAttributedPlaceHolder(text:String)
    {
        attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lastGridCVColor])
    }
}
