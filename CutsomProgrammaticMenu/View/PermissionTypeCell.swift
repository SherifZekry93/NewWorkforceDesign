//
//  PermissionTypeCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/24/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class PermissionTypeCell: UICollectionViewCell {
    
    let arrowImage:UIImageView = UIImageView(image: #imageLiteral(resourceName: "chevron-thin-right"))
    
    let permissionTypeLabel:UILabel = {
        let label = UILabel()
        label.text = "Permission Type"
        label.textColor = .headerLabelColor
        return label;
    }()
    
    let separatorView:UIView = {
        let v = UIView()
        v.backgroundColor = .innerCircleColor
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews()
    {
        arrowImage.anchorToView(size:.init(width: 9, height: 15))
        arrowImage.contentMode = .scaleAspectFit
        let stack = UIStackView(arrangedSubviews: [
            permissionTypeLabel,UIView(),arrowImage
        ])
        addSubview(stack)
        stack.anchorToView(leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), centerV: true)
        addSubview(separatorView)
        separatorView.anchorToView(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,  size: .init(width: 0, height: 1))
    }
    
}
