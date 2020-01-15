//
//  ProfileVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/12/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ProfileVC: UIViewController{
    let collectionView:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return cv
    }()
    let dailyMonthlySegmentedControl:UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Daily","Monthly"])
        seg.selectedSegmentIndex = 0
        seg.tintColor = .white
        seg.backgroundColor = .clear
        seg.anchorToView(size:.init(width: 0, height: 24.5))
        let fontAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                             NSAttributedString.Key.foregroundColor: UIColor.orange]
        let fontAttribute1 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                              NSAttributedString.Key.foregroundColor: UIColor.white]
        seg.setTitleTextAttributes(fontAttribute, for: .selected)
        seg.setTitleTextAttributes(fontAttribute1, for: .normal)
        
        return seg
    }()
    
    let topGradientBG:UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        v.backgroundColor = .orange
        return v;
    }()
    var isInShape = true;
    
    let gridButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grid").withRenderingMode(.alwaysOriginal), for: .normal)
        button.anchorToView(size:.init(width: 24.5, height: 24.5))
        button.addTarget(self, action: #selector(changeShape), for: .touchUpInside)
        return button
    }()
    
    let chartButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "chart").withRenderingMode(.alwaysOriginal), for: .normal)
        button.anchorToView(size:.init(width: 24.5, height: 24.5))
        button.addTarget(self, action: #selector(changeShape), for: .touchUpInside)
        return button
    }()
    @objc func changeShape(_ sender:UIButton)
    {
        if sender == gridButton && isInShape == true
        {
            isInShape = false
        }
        else if sender == chartButton && isInShape == false
        {
            isInShape = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .permissionBGColor;
    }
    private func setupViews()
    {
        addSubview(topGradientBG)
        topGradientBG.anchorToView(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 175))
        let stack = UIStackView(arrangedSubViews: [dailyMonthlySegmentedControl,chartButton,gridButton], axis: .horizontal, spacing: 12)
        addSubview(stack)
        stack.anchorToView(top: nil, leading: view.leadingAnchor, bottom: topGradientBG.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 14, bottom: 14, right: 14), size: .init(width: 0, height: 24.5))
    }
    
    private func setupCollectionView()
    {
        addSubview(collectionView)
        collectionView.anchorToView(top: topGradientBG.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        collectionView.register(PieChartCell.self, forCellWithReuseIdentifier: "piechart")
        collectionView.register(ProfileEmployeeInfo.self, forCellWithReuseIdentifier: "profileEmpInfo")
        collectionView.register(ProfileEmployeePendingRequestsCell.self, forCellWithReuseIdentifier: "ProfileEmployeePendingRequestsCell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        topGradientBG.dropShadow()
    }
}
extension ProfileVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "piechart", for: indexPath) as! PieChartCell
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileEmpInfo", for: indexPath) as! ProfileEmployeeInfo
            cell.dropShadow(color: .black, opacity: 0.1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEmployeePendingRequestsCell", for: indexPath) as! ProfileEmployeePendingRequestsCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return .init(width: view.frame.width - 30, height: view.frame.width)
        case 1:
            return .init(width: view.frame.width - 30, height: 150)
        default:
            return .init(width: view.frame.width - 30, height:40 + 40 + 160)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 35
    }
}
