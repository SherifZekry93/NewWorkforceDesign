//
//  RecentRequestsController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/2/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class RecentRequestsController: UIViewController {
    
    let recentRequestsLabel = HeaderLabel()
    
    let numberOfItems = 3
    
    let approvedLabel:UILabel = {
        let label = UILabel()
        label.setAttributedText(firstLine: "125\n", secondLine: "Approved", firstFontSize: 25, secondFontSize: 16, firstColor: .statisticsOrangeText,secondColor:.innerCircleColor,lineSpacing: 6)
        label.textAlignment = .center
        return label
    }()
    
    let rejectedLabel:UILabel = {
        let label = UILabel()
        label.setAttributedText(firstLine: "50\n", secondLine: "Pending", firstFontSize: 25, secondFontSize: 16, firstColor: .statisticsOrangeText,secondColor:.innerCircleColor,lineSpacing: 6)
        label.textAlignment = .center
        return label
    }()
    
    let pendingRequests:UILabel = {
        let label = UILabel()
        label.setAttributedText(firstLine: "32\n", secondLine: "Approved", firstFontSize: 25, secondFontSize: 16, firstColor: .statisticsOrangeText,secondColor:.innerCircleColor,lineSpacing: 6)
        label.minimumScaleFactor = 1
        label.textAlignment = .center
        return label
    }()
    
    let recentRequestsImageBG:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "orangeBGRight")
        
        image.transform = getAppLanguage() == "ar" ? CGAffineTransform(scaleX: -1, y: 1) : .identity
        return image
    }()
    
    let scrollDirectionImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "chevron-thin-right")
        image.anchorToView(size:.init(width:6,height:12))
        image.transform = getAppLanguage() == "ar" ? CGAffineTransform(scaleX: -1, y:1) : .identity
        return image
    }()
    
    lazy var collectionView:UICollectionView = {
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setupCollectionView()
        
        setupCountViews()
        
    }
    
    fileprivate func setupViews()
    {
        view.addSubview(recentRequestsImageBG)
        recentRequestsImageBG.anchorToView(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: -65, bottom: 0, right: -65), size: .init(width: 199, height: 424))
        recentRequestsLabel.text = "Recent Requests"
        view.addSubview(recentRequestsLabel)
        recentRequestsLabel.anchorToView(top: view.topAnchor, leading: view.leadingAnchor,padding:.init(top: 10, left: 10, bottom: 0, right: 10))
    }
    
    fileprivate func setupCountViews()
    {
        let dummyView = UIView()
        dummyView.backgroundColor = .clear
        view.addSubview(dummyView)
        dummyView.anchorToView(top: collectionView.bottomAnchor, leading: collectionView.leadingAnchor, bottom: view.bottomAnchor, trailing: collectionView.trailingAnchor, padding: .zero)
        let whiteBGView = UIView()
        whiteBGView.layer.cornerRadius = 10
        whiteBGView.backgroundColor = .white
        dummyView.addSubview(whiteBGView)
        whiteBGView.anchorToView(top: nil, leading: dummyView.leadingAnchor, bottom: nil, trailing: dummyView.trailingAnchor, padding: .zero, size: .init(width: 0, height: 80), centerH: nil, centerV: true)
        let statisticsStack = UIStackView(arrangedSubViews: [approvedLabel,rejectedLabel,pendingRequests], axis: .horizontal, spacing: 12)
        
        whiteBGView.addSubview(statisticsStack)
        statisticsStack.fillSuperView()
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}
extension RecentRequestsController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if numberOfItems * 160 > Int(collectionView.frame.width) //- 100
        {
            scrollDirectionImage.superview?.alpha = 1
        }
        return numberOfItems
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentRequestEmpDetailsCell", for: indexPath) as! RecentRequestEmpDetailsCell
        //
        yourCollectionViewCell.typeImage.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "Group 368") : #imageLiteral(resourceName: "Group 371")
        yourCollectionViewCell.typeLabel.text = indexPath.row % 2 == 0 ? "Vacation" : "Permission"
        yourCollectionViewCell.statusLabel.text = indexPath.row % 2 == 0 ? "Pending" : "Approved"
        yourCollectionViewCell.statusImage.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "Rectangle 128") : #imageLiteral(resourceName: "ActiveCellIcon")
        return yourCollectionViewCell
    }
    
    
    fileprivate func setupCollectionView()
    {
        view.addSubview(collectionView)
        collectionView.anchorToView(top: recentRequestsLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 13, bottom: 0, right: 13), size: .init(width: (view.frame.width - 20), height: 115))
        collectionView.backgroundColor = .clear
        collectionView.register(RecentRequestEmpDetailsCell.self, forCellWithReuseIdentifier: "recentRequestEmpDetailsCell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .horizontal
        }
        
        let dummyView = UIView()
        view.addSubview(dummyView)
        dummyView.anchorToView(top: nil, leading: view.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: -40, bottom: 0, right: -40), size: .init(width: 28, height: 28), centerH: nil, centerV: false)
        dummyView.backgroundColor = .white
        dummyView.layer.cornerRadius = 14
        dummyView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        dummyView.addSubview(scrollDirectionImage)
        scrollDirectionImage.anchorToView(centerH: true, centerV: true)
        dummyView.alpha = 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 160, height: 115)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x)
        
        if getAppLanguage() == "en"
        {
            if  scrollView.contentOffset.x > 0 //CGPoint(x: 0, y: 0)
            {
                UIView.animate(withDuration: 0.6) {
                    self.scrollDirectionImage.superview?.alpha = 0
                }
            }
            else
            {
                if numberOfItems * 160 > Int(collectionView.frame.width)
                {
                    UIView.animate(withDuration: 0.6) {
                        self.scrollDirectionImage.superview?.alpha = 1
                    }
                }
            }
        }
        else
        {
            
            if scrollView.contentOffset.x > 0 //CGPoint(x: 0, y: 0)
            {
                UIView.animate(withDuration: 0.6) {
                    self.scrollDirectionImage.superview?.alpha = 1
                }
            }
            else
            {
                if numberOfItems * 160 > Int(collectionView.frame.width)
                {
                    UIView.animate(withDuration: 0.6) {
                        self.scrollDirectionImage.superview?.alpha = 0
                    }
                }
            }
        }
    }
}
