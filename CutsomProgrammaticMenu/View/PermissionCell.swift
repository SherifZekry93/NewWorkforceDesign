//
//  PermissionCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/11/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class PermissionCell:UICollectionViewCell  {
    
    let profileImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 30;
        image.image = #imageLiteral(resourceName: "activeUser")
        return image
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Sherif Zekry";
        label.textColor = .headerLabelColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let permissionLabel:UILabel = {
        let label = UILabel()
        label.text = "Emergency Leave\nfrom 01-02-2020 To 10-02-2020"
        label.numberOfLines = -1
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .innerCircleColor
        return label
    }()
    
    let employeeCodeLabel:UILabel = {
        let label = UILabel()
        label.text = "208"
        label.textColor = .white
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    let doneButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_done_24px").withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = .lastGridCVColor
        return button
    }()
    
    let cancelRequestButton:UIButton = {
         let button = UIButton(type: .system)
         button.setImage(#imageLiteral(resourceName: "ic_clear_24px-1").withRenderingMode(.alwaysOriginal), for: .normal)
         button.backgroundColor = .lastGridCVColor
         return button
    }()
    
    let vacationTypeImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "ic_pan_tool_24px").withRenderingMode(.alwaysTemplate)
        image.tintColor = .headerControllerOrange
        image.anchorToView(size:.init(width: 13, height: 13))
        image.contentMode = .scaleAspectFit
        return image
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
        addSubview(profileImage)
        profileImage.anchorToView(leading: leadingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0) ,size: .init(width: 60, height: 60), centerV: true)
        
        
        let stack = UIStackView(arrangedSubViews: [
            UIStackView(arrangedSubViews: [nameLabel,employeeCodeLabel,UIView()], axis: .horizontal, spacing: 10,alignment: .leading),
            permissionLabel
        ], axis: .vertical, spacing: 8)
        
        addSubview(stack)
        
        stack.anchorToView(leading: profileImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 15, bottom: 0, right: 10))
        
        stack.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        addSubview(doneButton)
        addSubview(cancelRequestButton)
        doneButton.anchorToView(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 1, right: 0)
            , size: .init(width: frame.height / 2, height: frame.height / 2))//, centerH: <#T##Bool?#>, centerV: <#T##Bool?#>)
        cancelRequestButton.anchorToView(top: doneButton.bottomAnchor, leading: nil
            , bottom: nil, trailing: trailingAnchor, padding: .init(top: 1, left: 0, bottom: 0, right: 0)
            , size: .init(width: frame.height / 2, height: frame.height / 2))
        let dummyView = UIView()
        
        dummyView.anchorToView(size:.init(width: 30, height: 30))
        dummyView.backgroundColor = .white
        dummyView.layer.cornerRadius = 15
        dummyView.layer.borderColor = UIColor.headerControllerOrange.cgColor
        dummyView.layer.borderWidth = 1
        dummyView.addSubview(vacationTypeImage)
        vacationTypeImage.anchorToView(centerH: true, centerV: true)
        addSubview(dummyView)
        dummyView.anchorToView(top: nil, leading: profileImage.trailingAnchor, bottom: profileImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: -20, bottom: -5, right: 0))
    }
    
}
