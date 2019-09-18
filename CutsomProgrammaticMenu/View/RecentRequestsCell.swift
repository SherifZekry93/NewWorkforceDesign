//
//  RecentRequestsCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/2/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class RecentRequestsCell: UICollectionViewCell {
    
    let recentRequestsController:UIViewController = RecentRequestsController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(recentRequestsController.view)
        recentRequestsController.view.fillSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
