//
//  UpcomingVacationCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/2/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

class UpComingVacationCell: UICollectionViewCell {
    
    let firstBeachImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Beaches-in-India_1")
        image.anchorToView(size:.init(width:0,height:145.76))
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.backgroundColor = .red
        image.layer.cornerRadius = 8
        return image
    }()
    
    let secondBeachImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Beaches-in-India_1")
        image.contentMode = .scaleToFill
        image.anchorToView(size:.init(width:0,height:145.76))
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    
    
    let firstOverlay:UIView = UIView()
    
    let secondOverlay:UIView = UIView()
    
    let upcomingVacationsLabel:UILabel = {
        let label = UILabel()
        label.setAttributedText(firstLine: "Upcoming Vacations\n", secondLine: "Lorem Ipusem Lorem Ipusem Lorem Ipusem\nLorem Ipusem Lorem Ipusem", firstFontSize: 16, secondFontSize: 10, firstColor: .white, secondColor: .lastGridCVColor,lineSpacing: 8)
        label.textAlignment = getAppLanguage() == "en" ? .left : .right
        return label
    }()
    
    let missionaryLabel:UILabel = {
        let label = UILabel()
        label.setAttributedText(firstLine: "Our missions\n", secondLine: "Lorem Ipusem Lorem Ipusem Lorem Ipusem\nLorem Ipusem Lorem Ipusem", firstFontSize: 16, secondFontSize: 10, firstColor: .white, secondColor: .lastGridCVColor,lineSpacing: 8)
        label.textAlignment = getAppLanguage() == "en" ? .left : .right
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame:  frame)
        
        
        setupViews()
        
    }
    
    let upComingVacationButton :UIButton = {
        let button = UIButton()
        button.setTitle("Read More", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange//UIColor(red: 215, green: 7, blue: 1)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return button
    }()
    
    let upComingMissionaryButton :UIButton = {
        let button = UIButton()
        button.setTitle("Read More", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange//UIColor(red: 215, green: 7, blue: 1)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        // upComingVacationButton.applyGradient(colours: [UIColor(red: 250, green: 194, blue: 33), UIColor(red: 215, green: 7, blue: 1)])
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.bounds = upComingVacationButton.bounds
        gradientLayer.colors =
            [[UIColor(red: 250, green: 194, blue: 33), UIColor(red: 215, green: 7, blue: 1)]]
        //Use diffrent colors
        upComingVacationButton.layer.addSublayer(gradientLayer)
        
    }
    
    fileprivate func setupViews()
    {
        firstOverlay.backgroundColor = UIColor(red: 54/255, green: 56/255, blue: 71/255, alpha: 0.65)
        secondOverlay.backgroundColor = firstOverlay.backgroundColor
        addSubview(firstBeachImage)
        firstBeachImage.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: 20))
        firstBeachImage.addSubview(firstOverlay)
        firstOverlay.fillSuperView(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        addSubview(secondBeachImage)
        secondBeachImage.anchorToView(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 30, right: 20))
        secondBeachImage.addSubview(secondOverlay)
        secondOverlay.fillSuperView(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        firstOverlay.addSubview(upcomingVacationsLabel)
        upcomingVacationsLabel.anchorToView(top: firstOverlay.topAnchor, leading: firstOverlay.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 80))
        secondOverlay.addSubview(missionaryLabel)
        missionaryLabel.anchorToView(top: secondOverlay.topAnchor, leading: secondOverlay.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 80))
        firstOverlay.addSubview(upComingVacationButton)
        
        upComingVacationButton.anchorToView(top: upcomingVacationsLabel.bottomAnchor, leading: upcomingVacationsLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 67, height: 29))
        
        secondOverlay.addSubview(upComingMissionaryButton)
        upComingMissionaryButton.anchorToView(top: missionaryLabel.bottomAnchor, leading: missionaryLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 67, height: 29))//, centerH: <#T##Bool?#>, centerV: <#T##Bool?#>)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
