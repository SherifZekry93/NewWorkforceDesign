//
//  FourthVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/19/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//
import UIKit

class FourthVC: BaseMenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustNavigationControllers()
        let label = UILabel()
        label.text = "In the middle"
        //baseView.addSubview(label)
        label.anchorToView(centerH: true, centerV: true)
    }
}
