//
//  MenuCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/10/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class MenuCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor(white: 0.2, alpha: 0.3) : UIColor.clear
        }
    }
    
    let image:UIImageView = {
       let image = UIImageView()
        image.anchorToView(size:.init(width:13,height:13))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let menuLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews()
    {
        let stack = UIStackView(arrangedSubViews: [
        image,menuLabel
        ], axis: .horizontal, spacing: 5)
        stack.alignment = .center
        addSubview(stack)
        stack.anchorToView(centerH: true, centerV: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
