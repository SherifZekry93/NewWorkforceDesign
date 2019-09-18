//
//  CVHeaderCVCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/3/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class CVHeaderCVCell: UICollectionViewCell {
    
    let EmployeeIcon:UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "activeUser")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let activeIcon:UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "activeIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let activeEmployeesCount:UILabel = {
       let label = UILabel()
        label.text = "25"
        label.textColor = .white
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let activeEmployeesLabelImg:UILabel = {
        let label = UILabel()
        label.text = "Active\nEmployee"
        label.numberOfLines = -1
        label.textColor = .white
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 29, weight: .bold)
        return label
    }()
    
    let cellBG:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "shapecellbg")
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(EmployeeIcon)
        addSubview(activeIcon)
        addSubview(activeEmployeesCount)
        addSubview(activeEmployeesLabelImg)
        EmployeeIcon.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 66.43, height: 81.59))
        activeIcon.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 70, left: 65, bottom: 0, right: 0), size: .init(width: 29, height: 29))
        activeEmployeesCount.anchorToView(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 25))
        activeEmployeesLabelImg.anchorToView(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 25, right: 0), size: .init(width: 153, height: 75))
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
