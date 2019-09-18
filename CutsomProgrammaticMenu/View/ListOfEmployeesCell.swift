//
//  ListOfEmployeesCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/2/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ListOfEmployeesCell: UICollectionViewCell {
    let lstOfEmployeeController:UIViewController = ListOfEmployeeController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lstOfEmployeeController.view)
        lstOfEmployeeController.view.fillSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
