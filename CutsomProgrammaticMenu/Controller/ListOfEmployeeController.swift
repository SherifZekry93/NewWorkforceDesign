//
//  ListOfEmployeeController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/4/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class ListOfEmployeeController: UIViewController {
    let lstOfEmployeesLabel = HeaderLabel()
    
    let collectionView:UICollectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    
    fileprivate func setupViews()
    {
        lstOfEmployeesLabel.text = "List of Employees"
        view.addSubview(lstOfEmployeesLabel)
        lstOfEmployeesLabel.anchorToView(top: view.topAnchor, leading: view.leadingAnchor,padding:.init(top: 10, left: 10, bottom: 0, right: 10))
    }
    
}
extension ListOfEmployeeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emplistempCell", for: indexPath) as! EmpListEmployeeCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID", for: indexPath) as! ListOfEmployeeHeaderView
        header.backgroundColor = .lastGridCVColor
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 38, height: 36)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width - 38, height: 22)
    }
    
    fileprivate func setupCollectionView()
    {
        view.addSubview(collectionView)
        collectionView.anchorToView(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 60, left: 19, bottom: 19, right: 19))
        collectionView.register(ListOfEmployeeHeaderView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")
        collectionView.register(EmpListEmployeeCell.self, forCellWithReuseIdentifier: "emplistempCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .cvBG
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        collectionView.bounces = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
