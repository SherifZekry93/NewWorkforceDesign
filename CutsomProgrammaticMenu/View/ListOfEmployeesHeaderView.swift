//
//  ListOfEmployeesHeaderView.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/4/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ListOfEmployeeHeaderView: UICollectionReusableView {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .headerLabelColor
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let vacationsLabel:UILabel = {
        let label = UILabel()
        label.textColor = .headerLabelColor
        label.text = "Vacations"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let permissionsLabel:UILabel = {
        let label = UILabel()
        label.textColor = .headerLabelColor
        label.text = "Permissions"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupViews()
    {
        let stack = UIStackView(arrangedSubViews: [nameLabel,vacationsLabel,permissionsLabel]
            , axis: .horizontal, spacing: 0)
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8))//, size: <#T##CGSize#>, centerH: <#T##Bool?#>, centerV: <#T##Bool?#>)
    }
}
