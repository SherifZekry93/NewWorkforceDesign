//
//  UILabel.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/2/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

extension UILabel
{
    func setAttributedText(firstLine:String,secondLine:String,firstFontSize:CGFloat,secondFontSize:CGFloat,firstColor:UIColor,secondColor:UIColor,lineSpacing:CGFloat = 3)
    {
        numberOfLines = -1
        
        let labelAttributedText = NSMutableAttributedString(string: firstLine, attributes: [NSAttributedString.Key.font:UIFont.monospacedDigitSystemFont(ofSize: firstFontSize, weight: .bold)
            ,NSAttributedString.Key.foregroundColor:firstColor])
        
        labelAttributedText.append(NSAttributedString(string:secondLine, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: secondFontSize), NSAttributedString.Key.foregroundColor: secondColor]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = lineSpacing // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        labelAttributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, labelAttributedText.length))
        
        // *** Set Attributed String to your label ***

        
        attributedText = labelAttributedText
    }
}
