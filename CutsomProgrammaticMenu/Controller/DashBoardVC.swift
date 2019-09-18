//
//  DashBoardVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/31/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class DashboardVC:BaseMenuVC {
    let flowLayout = UICollectionViewFlowLayout()
    
    lazy var  collectionView:UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationController?.navigationBar.isHidden = true
        dashboardOpenerView.isUserInteractionEnabled = false
        adjustNavigationControllers()
        if Authenticate(animated: false)
        {
            
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}
extension DashboardVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circularPercentageCell", for: indexPath) as! CircularPercentageRowCell
            cell.backgroundColor = .dashboardGray
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentRequestsCell", for: indexPath) as! RecentRequestsCell
            cell.backgroundColor = .dashboardGray//UIColor(white: 0.95, alpha: 1)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingVacationCell", for: indexPath) as! UpComingVacationCell
            cell.backgroundColor = .dashboardGray//.lightGray//UIColor(white: 0.95, alpha: 1)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listOfEmployeesCell", for: indexPath) as! ListOfEmployeesCell
            cell.backgroundColor = .white//UIColor(white: 0.95, alpha: 1)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listOfEmployeesCell", for: indexPath)
            cell.backgroundColor = .green
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    fileprivate func setupCollectionView()
    {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DashBoardHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")
        collectionView.register(CircularPercentageRowCell.self, forCellWithReuseIdentifier: "circularPercentageCell")
        collectionView.register(RecentRequestsCell.self, forCellWithReuseIdentifier: "recentRequestsCell")
        collectionView.register(UpComingVacationCell.self, forCellWithReuseIdentifier: "upComingVacationCell")
        collectionView.register(ListOfEmployeesCell.self, forCellWithReuseIdentifier: "listOfEmployeesCell")
        view.addSubview(collectionView)
        collectionView.fillSuperView()
        view.insertSubview(collectionView, belowSubview: darkFillView)
        collectionView.backgroundColor = .white
        collectionView.bounces = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 424)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! DashBoardHeader
        header.backgroundColor = UIColor.dashboardGray
        //header.backgroundColor =/ UIColor(red: 247/255, green: 246/255, blue: 255/255, alpha: 1)//.white
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return .init(width: view.frame.width, height: 220)
        case 1:
            return .init(width: view.frame.width, height: 320)
        case 2:
            return .init(width: 0, height: 0)
        case 3:
            return .init(width: view.frame.width, height:380)
        case 4:
            return .init(width: view.frame.width, height: 373)
        default:
            return .init(width: view.frame.width, height: 400)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
