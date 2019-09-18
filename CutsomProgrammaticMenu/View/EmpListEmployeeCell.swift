//
//  EmpListEmployeeCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/4/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class EmpListEmployeeCell: UICollectionViewCell {
    
    let empImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.anchorToView(size:.init(width:20,height:20))
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let empName:UILabel = {
        let label = UILabel()
        label.text = "Sherif Zekry"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)//UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let empVacationsLabel:UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)//UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        
        return label
    }()

    let empPermissionsLabel:UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)//UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
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
        let stack = UIStackView(arrangedSubViews: [
            UIStackView(arrangedSubViews: [empImage,empName], axis: .horizontal, spacing: 4),
            empVacationsLabel,
            empPermissionsLabel
            ], axis: .horizontal, spacing: 0)
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.fillSuperView(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        backgroundColor = .white
    }
}
