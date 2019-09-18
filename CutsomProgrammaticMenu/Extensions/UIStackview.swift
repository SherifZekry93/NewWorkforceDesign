//
//  UIStackview.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/5/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit


extension UIStackView
{
    convenience init(arrangedSubViews:[UIView],axis:NSLayoutConstraint.Axis,spacing:CGFloat,alignment:UIStackView.Alignment? = nil)
    {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
        if let align = alignment
        {
            self.alignment = align
        }
    }
}

