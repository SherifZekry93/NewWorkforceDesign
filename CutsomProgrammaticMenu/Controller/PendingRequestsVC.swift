//
//  PendingRequestsVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/10/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class PendingRequestsVC: BaseMenuVC {
    
    let topGradientBG:UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        v.backgroundColor = .orange
        return v;
    }()
    
    let menuCollectionView:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .clear
        return cv
    }()
    
    let backButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_arrow_back_left_24px"), for: .normal)
        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return button
    }()
    
    let menuItems = [
        MenuItem(name: "All", image: ""),
        MenuItem(name: "Vacation", image: "ic_beach_access_24px"),
        MenuItem(name: "Permission", image: "ic_pan_tool_24px"),
    ]
    
    let requestsCV:UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupSegmentedControl()
        setupHorizontalMenuBar()
        setupRequestsCV()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .permissionBGColor//UIColor(white: 0.93, alpha: 1)
        requestsOpenerView.isUserInteractionEnabled = false
    }
    
    var barLeftAnchor:NSLayoutConstraint?
    
    func setupHorizontalMenuBar()
    {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .white
        addSubview(horizontalBarView)
        horizontalBarView.anchorToView(top: nil, leading: menuCollectionView.leadingAnchor, bottom: menuCollectionView.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size:.init(width: view.frame.width / 3, height: 2.5))
        barLeftAnchor = horizontalBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        barLeftAnchor?.isActive = true
    }

    private func setupViews()
    {
        view.insertSubview(topGradientBG, belowSubview: darkFillView)
        //addSubview(topGradientBG)
        topGradientBG.anchorToView(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 175))
        addSubview(menuCollectionView)
        menuCollectionView.anchorToView(top: nil, leading: view.leadingAnchor, bottom: topGradientBG.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 50))
    }
    
    private func setupSegmentedControl()
    {
        if let flowLayout = menuCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            flowLayout.scrollDirection = .horizontal
        }
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
    }
    private func setupRequestsCV()
    {
        requestsCV.register(PermissionCell.self, forCellWithReuseIdentifier: "permissionCell")
        requestsCV.delegate = self
        requestsCV.dataSource = self
        view.insertSubview(requestsCV, belowSubview: darkFillView)
        requestsCV.anchorToView(top: topGradientBG.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 30, right: 5))
    }
    @objc func chnageSegmentedControlIndex(_ sender:UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        default:
            print("what is index?")
        }
    }
    @objc func dismissController()
    {
        navigationController?.popViewController(animated: true);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topGradientBG.dropShadow()
    }
    
}
extension PendingRequestsVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
            cell.backgroundColor = .clear
            cell.menuLabel.text = menuItems[indexPath.row].name
            cell.image.image = UIImage(named: menuItems[indexPath.row].image)
            
            return cell
        }
        else
        {
            let cell = requestsCV.dequeueReusableCell(withReuseIdentifier: "permissionCell", for: indexPath) as! PermissionCell
            cell.backgroundColor = .white
            cell.dropShadow(color: UIColor(white: 0.74, alpha: 1), opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView
        {
            print("Menu")
            return 3
        }
        else
        {
            print("Normal")
            return 200
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView
        {
            return .init(width: view.frame.width / 3, height: 50)
        }
        else
        {
            return .init(width: view.frame.width - 30, height: 85)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == menuCollectionView
        {
            return 0
        }
        return 20
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == menuCollectionView
        { 
            print("a7a")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuCollectionView
        {
            let distance = view.frame.width / 3
            UIView.animate(withDuration: 0.4)
            {
                self.barLeftAnchor?.constant = CGFloat(indexPath.row) * distance
                self.view.layoutIfNeeded()
            }
            self.menuCollectionView.deselectItem(at: indexPath, animated: true)
            indexChanged(index: indexPath.row)
        }
    }
    private func indexChanged(index:Int)
    {
        switch index {
        case 0:
            print("0")
        case 1:
            print("1")
        default:
            print("2")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == requestsCV
        {
            return .init(top: 20, left: 10, bottom:10, right: 10)
        }
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}
