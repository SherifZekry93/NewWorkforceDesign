//
//  DashboardHeaderController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 8/31/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class DashboardHeaderController: UIViewController {
    
    var empstatistics:[TeamStatistics] = [TeamStatistics]()
    
    let leftBGImage:UIImageView  = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "HeaderSideImage")
        image.transform = getAppLanguage() == "ar" ?  CGAffineTransform(scaleX: -1, y: 1) : .identity
        return image
    }()
    
    lazy var collectionView:UICollectionView = {
        let collection =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return collection
    }()
    
    let userImg:UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 13
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Administrator"
        label.textColor = .white
        return label
    }()
    
    let notificatioonImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    let dashBoardLabel:UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    fileprivate func setupViews()
    {
        view.addSubview(leftBGImage)
        leftBGImage.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 0))
        let userDetailsStack = UIStackView(arrangedSubviews: [userImg,nameLabel])
        userDetailsStack.spacing = 10
        userImg.anchorToView(size:.init(width: 26, height: 26))
        view.addSubview(userDetailsStack)
        userDetailsStack.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 16, bottom: 0, right: 0))
        view.addSubview(dashBoardLabel)
        dashBoardLabel.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: userDetailsStack.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 80, left: 0, bottom: 0, right: 0))
    }
    
}
extension DashboardHeaderController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvHeaderCVCell", for: indexPath) as! CVHeaderCVCell
        if indexPath.row == 0
        {
            cell.backgroundColor = .headerControllerOrange
            
            if let first = empstatistics.first
            {
                cell.activeEmployeesCount.text = "\(first.empCount ?? 0)"
            }
            else
            {
                cell.activeEmployeesCount.text = "0"
            }
            cell.activeEmployeesLabelImg.text = "Active\nEmployees";
        }
        else if indexPath.row == 1
        {
            cell.backgroundColor = .headerControlllerBlue
            if let first = empstatistics.first
            {
                cell.activeEmployeesCount.text = "\(first.vacationCount ?? 0)"
            }
            else
            {
                cell.activeEmployeesCount.text = "0"
            }
            cell.activeIcon.isHidden  = true
            cell.activeEmployeesLabelImg.text = "Vacation\nEmployees"

        }
        else
        {
            cell.backgroundColor = .redCircleText
            if let first = empstatistics.first
            {
                cell.activeEmployeesCount.text = "\(first.absenceCount ?? 0)"
            }
            else
            {
                cell.activeEmployeesCount.text = "0"
            }
            cell.activeIcon.isHidden  = true
            cell.activeEmployeesLabelImg.text = "Absent\nEmployees"
        }
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 238.93, height: 238.93)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    fileprivate func setupCollectionView(){
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.register(CVHeaderCVCell.self, forCellWithReuseIdentifier: "cvHeaderCVCell")
        //        let width = view.frame.width
        
        
        collectionView.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 145.36, left: 50, bottom: 160, right: 0))
        
        
        collectionView.anchorToView(size: .init(width:0, height: 238.93))
        
        //        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width / 5).isActive = true
        
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .horizontal
        }
        collectionView.bounces = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
