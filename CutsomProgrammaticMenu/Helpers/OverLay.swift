//
//  OverLay.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/16/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class OverLay:UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 54/255, green: 56/255, blue: 71/255, alpha: 0.70)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
