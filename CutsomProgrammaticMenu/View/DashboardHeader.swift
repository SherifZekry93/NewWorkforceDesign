//
//  DashboardHeader.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/31/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class DashBoardHeader: UICollectionReusableView {
    let appHeaderHorizontalController = DashboardHeaderController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
