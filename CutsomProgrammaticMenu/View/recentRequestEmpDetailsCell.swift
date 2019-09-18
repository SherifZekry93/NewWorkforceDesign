//
//  recentRequestEmpDetailsCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/3/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class RecentRequestEmpDetailsCell: UICollectionViewCell {
    
    let empImage:UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .yellow
        image.anchorToView(size:.init(width:25,height:25))
        image.clipsToBounds = true
        image.layer.cornerRadius = 12.5
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let empName:UILabel = {
        let label = UILabel()
        label.text = "Sherif Zekry"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)//UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let dateImage:UIImageView = {
       let image = UIImageView()
        image.anchorToView(size:.init(width:10,height:13))
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "calendar3")
        //image.image =
        return image
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.text = "Fromt 11-8 to 12-8"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .regular)//UIFont.systemFont(ofSize: 10)
        return label
    }()

    
    let typeImage:UIImageView = {
       let image = UIImageView()
        image.anchorToView(size:.init(width:13,height:13))
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "Group 371")
        return image
    }()
    
    let typeLabel:UILabel = {
        let label = UILabel()
        label.text = "Vacation"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 10, weight: .regular)//UIFont.systemFont(ofSize: 10)
        return label
    }()

    let statusImage:UIImageView = {
        let image = UIImageView()
        image.anchorToView(size:.init(width:10,height:10))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let statusLabel:UILabel = {
        let label = UILabel()
        label.text = "Pending"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 10, weight: .regular)//UIFont.systemFont(ofSize: 10)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews()
    {
        backgroundColor = .white
        layer.cornerRadius = 10
        let stackView = UIStackView(arrangedSubViews: [
            UIStackView(arrangedSubViews: [empImage,empName],axis: .horizontal,spacing: 4),
            UIStackView(arrangedSubViews: [getDummyView(image: dateImage),dateLabel],axis: .horizontal,spacing: 4),
            UIStackView(arrangedSubViews: [getDummyView(image: typeImage),typeLabel],axis: .horizontal,spacing: 4),
            UIStackView(arrangedSubViews: [getDummyView(image: statusImage),statusLabel],axis: .horizontal,spacing: 4)
            ], axis: .vertical, spacing: 0)
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
    }
    
    fileprivate func getDummyView(image:UIImageView) -> UIView
    {
        let dummy = UIView()
        dummy.anchorToView(size:.init(width: 25, height: 25))
        dummy.addSubview(image)
        image.anchorToView(centerH: true, centerV: true)
        return dummy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
