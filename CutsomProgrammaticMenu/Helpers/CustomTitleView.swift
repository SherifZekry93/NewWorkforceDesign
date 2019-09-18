//
//  CustomTitleView.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class CustomTitleView: UIView {
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        backgroundColor = .orangeTitle
        
        titleLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .regular)
        
        titleLabel.textColor = .white
        
        titleLabel.anchorToView(centerH: true, centerV: true)

        addSubview(titleLabel)
        
        titleLabel.anchorToView(centerH:true,centerV:true)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
        
    }
    
}
