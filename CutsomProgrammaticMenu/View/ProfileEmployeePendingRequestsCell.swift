//
//  ProfileEmployeePendingRequestsCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ProfileEmployeePendingRequestsCell:UICollectionViewCell
{
    let collectionView:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    let headerLabel:UILabel = {
        let label = UILabel()
        label.text = "Employee Requests"
        label.textColor = .headerLabelColor
        label.font = .systemFont(ofSize: 20)
        return label
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
        addSubview(headerLabel)
        headerLabel.anchorToView(top: topAnchor, leading: leadingAnchor, size: .init(width: 0, height: 40))
        addSubview(collectionView)
        collectionView.anchorToView(top: headerLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        collectionView.register(ProfileEmployeePendingRequestsCellForInternalCV.self, forCellWithReuseIdentifier: "ProfileEmployeePendingRequestsCellForInternalCV")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension ProfileEmployeePendingRequestsCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEmployeePendingRequestsCellForInternalCV", for: indexPath) as!  ProfileEmployeePendingRequestsCellForInternalCV
        cell.backgroundColor = .white
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 80)
    }
}
class  ProfileEmployeePendingRequestsCellForInternalCV:UICollectionViewCell
{
    let lineImage = UIImageView(image: UIImage(named: "Line_43"))
    
    let numberOfRequestsLabel:UILabel = {
        let label = UILabel()
        label.text = "24";
        label.font = .boldSystemFont(ofSize: 30);
        label.textAlignment = .center
        label.textColor = .calendarHeaderView
        return label
    }()
    
    let pendingRequestsLabel:UILabel = {
        let label = UILabel()
        label.text = "Pending Requests"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let pendingRequestDate:UILabel = {
        let label = UILabel()
        label.text = "Last Request 22-9-2019";
        label.font = .systemFont(ofSize: 12)
        label.textColor = .innerCircleColor
        return label
    }()
    
    let requestDate:UILabel = {
       let label = UILabel()
        label.text = "";
        return label
    }()
    let infoIcon = UIImageView(image: #imageLiteral(resourceName: "info-with-circle-1"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews()
    {
        addSubview(lineImage)
        lineImage.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 94.5, bottom: 0, right: 0), size: .init(width: 1, height: 0))
        let dummy1 = getDummyImage()
        let dummy2 = getDummyImage()
        addSubview(dummy1)
        dummy1.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: -15, left: 80, bottom: 0, right: 0))
        addSubview(dummy2)
        dummy2.anchorToView(leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 80, bottom: -15, right: 0))
        addSubview(numberOfRequestsLabel)
        numberOfRequestsLabel.anchorToView(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: dummy1.leadingAnchor, padding: .zero)
        
        addSubview(pendingRequestsLabel)
        pendingRequestsLabel.anchorToView(top: topAnchor, leading: dummy1.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 25, left: 35, bottom: 0, right: 0))
        addSubview(pendingRequestDate)
        pendingRequestDate.anchorToView(top: pendingRequestsLabel.bottomAnchor, leading: pendingRequestsLabel.leadingAnchor, bottom: nil, trailing: pendingRequestsLabel.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 0))//, size: , centerH: <#T##Bool?#>, centerV: info)
        addSubview(infoIcon)
        
        infoIcon.anchorToView(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 20, height: 20), centerV: true)
    }
    
    private func getDummyImage() -> UIView
    {
        let dummyView = UIView()
        dummyView.backgroundColor = .permissionBGColor
        dummyView.anchorToView(size: .init(width: 30, height: 30))
        dummyView.layer.cornerRadius = 15
        dummyView.clipsToBounds = true
        return dummyView
    }
}
