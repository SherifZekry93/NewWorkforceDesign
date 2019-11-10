//
//  UIColor.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/3/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
extension UIColor
{
    static let dashboardGray:UIColor = UIColor(red: 247, green: 246, blue: 255)
    static let headerControllerOrange:UIColor = UIColor(red: 251, green: 150, blue: 36)
    static let headerControlllerBlue:UIColor = UIColor(red: 51, green: 208, blue: 249)
    static let headerLabelColor:UIColor = UIColor(red: 119, green: 119, blue: 119)
    static let innerCircleColor:UIColor = UIColor(red: 153, green: 153, blue: 153)
    static let greenCircleText:UIColor = UIColor(red: 8, green: 171, blue: 8)
    static let redCircleText:UIColor = UIColor(red: 215, green: 7, blue: 1)
    static let blueCircleText:UIColor = UIColor(red: 0, green: 112, blue: 197)
    static let statisticsOrangeText:UIColor = UIColor(red: 250, green: 149, blue: 33)
    static let lastGridCVColor = UIColor(red: 216, green: 216, blue: 216)
    static let cvBG = UIColor(red: 196, green: 196, blue: 196)
    static let orangeTitle = UIColor(red: 284, green: 147, blue: 90)
    static let redMessageColor = UIColor(red: 215, green: 7, blue: 1)
    static let calendarHeaderView = UIColor(red: 54, green: 56, blue: 71)
    static let permissionBGColor = UIColor(red: 245, green: 249, blue: 250)
    static let aboutTextColor = UIColor(red: 117, green: 125, blue: 128)
    static let greenMessageColor = UIColor(red: 8, green: 171, blue: 8)
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}
