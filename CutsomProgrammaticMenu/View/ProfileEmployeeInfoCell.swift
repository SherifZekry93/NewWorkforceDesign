//
//  ProfileEmployeeInfoCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ProfileEmployeeInfo: UICollectionViewCell {
    let departmentNameLabel:UILabel = {
       let label = UILabel()
        label.text = "UI/UX Designer & Developer";
        label.textColor = .headerLabelColor
        return label
    }()
    
    let joinDateLabel:UILabel = {
       let label = UILabel()
        label.text = "11-11-2018";
        label.textColor = .headerLabelColor
        return label
    }()
    
    let positionLabel:UILabel = {
       let label = UILabel()
        label.text = "Senior";
        label.textColor = .headerLabelColor
        return label
    }()
    
    let dummyBGView:UIView = {
       let v = UIView()
        v.backgroundColor = .lightSeparatorColor
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews()
    {
        addSubview(dummyBGView)
        dummyBGView.fillSuperView(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        let stack = UIStackView(arrangedSubViews: [
        stackItemView(labelText: "Department", label: departmentNameLabel),
        stackItemView(labelText: "Join Date", label: joinDateLabel),
        stackItemView(labelText: "Position", label: positionLabel),
        ], axis: .vertical, spacing: 1)
        stack.distribution = .fillEqually
        dummyBGView.addSubview(stack)
        stack.fillSuperView()
    }
    private func stackItemView(labelText:String,label:UILabel) -> UIView
    {
        let v = UIView()
        v.backgroundColor = .white
        
        let textLabel = UILabel()
        textLabel.text = labelText
        
        let stack = UIStackView(arrangedSubviews: [
                textLabel,UIView(),label
        ])
        stack.distribution = .fill
        v.addSubview(stack)
        stack.fillSuperView()
        return v
    }
}
