//
//  HeaderLabel.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/1/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class HeaderLabel: UILabel {
    override var text: String? {
        didSet {
            let spacing = 6 // will be added as negative bottom margin for more spacing between label and line
            
            let line = UIView()
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = textColor
            addSubview(line)
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[line]|", metrics: nil, views: ["line":line]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(1)]-(\(-spacing))-|", metrics: nil, views: ["line":line]))
            self.attributedText = attributedText
            font = UIFont.monospacedDigitSystemFont(ofSize: 25, weight: .bold)
            textColor = .headerLabelColor
        }
    }
}
