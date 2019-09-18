//
//  CircularPercentageRowCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/1/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import UICircularProgressRing

class CircularPercentageRowCell: UICollectionViewCell {
    
    let onlineRing = UICircularProgressRing()

    let offlineRing = UICircularProgressRing()
    
    let vacationRing = UICircularProgressRing()
    
    let onlineLabel:UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.setAttributedText(firstLine: "25%\n", secondLine: "Online", firstFontSize: 25, secondFontSize: 11, firstColor: .greenCircleText,secondColor: .greenCircleText)
        label.textAlignment = .center
        return label
    }()
    let offlineLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setAttributedText(firstLine: "50%\n", secondLine: "Offline", firstFontSize: 25, secondFontSize: 11, firstColor: .redCircleText,secondColor: .redCircleText)
        label.textAlignment = .center
        return label
    }()
    let vacationLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setAttributedText(firstLine: "75%\n", secondLine: "Vacation", firstFontSize: 25, secondFontSize: 11, firstColor: .greenCircleText,secondColor: .blueCircleText)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        addDummyViews(label: onlineLabel, ring: onlineRing)

        addDummyViews(label: offlineLabel, ring: offlineRing)

        addDummyViews(label: vacationLabel, ring: vacationRing)
        onlineRing.innerRingColor = .greenCircleText
        offlineRing.innerRingColor = .redCircleText
        vacationRing.innerRingColor = .blueCircleText
    }
    
    fileprivate func addDummyViews(label:UILabel,ring:UICircularProgressRing)
    {
        let dummyView1 = UIView()
        dummyView1.backgroundColor = .white
        addSubview(dummyView1)
        dummyView1.centerXAnchor.constraint(equalTo: ring.centerXAnchor).isActive = true
        dummyView1.centerYAnchor.constraint(equalTo: ring.centerYAnchor).isActive = true
        dummyView1.anchorToView(size: .init(width: 80, height: 80))
        dummyView1.layer.cornerRadius = 40

        dummyView1.addSubview(label)
        label.fillSuperView()
    }
    override func layoutSubviews() {
        print(onlineRing.frame.width)
    }
    fileprivate func setupViews()
    {
        let label = HeaderLabel()
        label.text = "Employee Statistics\n"
        addSubview(label)
        
        label.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        

        let stack = UIStackView(arrangedSubviews: [onlineRing,offlineRing,vacationRing])
        
        stack.distribution = .equalSpacing
        
        setCircularBarProgress(progress: onlineRing,fontColor: .green, progressValue: 25)
        
        setCircularBarProgress(progress: offlineRing,fontColor: .red, progressValue: 50)
        
        setCircularBarProgress(progress: vacationRing, fontColor: .blue, progressValue: 75)
        
        
        addSubview(stack)
        stack.anchorToView(top: topAnchor, leading: leadingAnchor, bottom:bottomAnchor, trailing: trailingAnchor, padding: .init(top: 40, left: 15, bottom:0, right: 15), size:.init(width:0,height:0),centerH: true,centerV: true)
        
    }
    fileprivate func setCircularBarProgress(progress:UICircularProgressRing,fontColor:UIColor,progressValue:CGFloat)
    {
        progress.style = .ontop
        progress.maxValue = 100
        progress.fontColor = fontColor
        progress.innerRingColor = .orange
        progress.tintColor = .orange
        progress.font = .boldSystemFont(ofSize: 14)
        progress.startAngle = 270
        progress.startProgress(to: progressValue, duration: 0.5, completion: nil)
        progress.outerRingColor = UIColor.innerCircleColor
        progress.anchorToView(size:.init(width: 100, height: 100))
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
