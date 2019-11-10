//
//  PendingRequestsVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/10/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
//import PageMenu
//
//class PendingRequestsVC: UIViewController {
//
//    let topGradientBG:UIView = {
//        let v = UIView()
//        v.layer.masksToBounds = true
//        return v;
//    }()
//    var pageMenu : CAPSPageMenu?
//
//    let backButton:UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "ic_arrow_back_left_24px"), for: .normal)
//        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
//        return button
//    }()
//
//    let requestsSegmentedControl:UISegmentedControl = {
//        let segment = UISegmentedControl()
//        segment.addTarget(self, action: #selector(chnageSegmentedControlIndex), for: .valueChanged)
//        segment.tintColor = .white
//        return segment;
//    }()
//
//    let requestsCV:UICollectionView = {
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        return cv
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupSegmentedControl()
//        navigationController?.navigationBar.isHidden = true
//        view.backgroundColor = .white
//    }
//
//    private func setupViews()
//    {
//        addSubview(topGradientBG)
//        topGradientBG.anchorToView(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 175))
//        addSubview(requestsSegmentedControl)
//        requestsSegmentedControl.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 50))
//    }
//
//    private func setupSegmentedControl()
//    {
//        requestsSegmentedControl.insertSegment(withTitle: "All", at: 0, animated: false)
//        let image = UIImage.textEmbededImage(image: #imageLiteral(resourceName: "ic_beach_access_24px"), string: "Vaccation", color: .white)
//        requestsSegmentedControl.insertSegment(with: image, at: 1, animated: false)
//        let image2 = UIImage.textEmbededImage(image: #imageLiteral(resourceName: "ic_pan_tool_24px").withRenderingMode(.alwaysOriginal), string: "Permission", color: .white)
//        requestsSegmentedControl.insertSegment(with: image2, at: 2, animated: false)
//    }
//    @objc func chnageSegmentedControlIndex(_ sender:UISegmentedControl)
//    {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            print("0")
//        case 1:
//            print("1")
//        default:
//            print("what is index?")
//        }
//    }
//    @objc func dismissController()
//    {
//        navigationController?.popViewController(animated: true);
//    }
//
//    override func viewDidLayoutSubviews() {
//        setupGradient()
//    }
//
//    private func setupGradient()
//    {
//        let gradient: CAGradientLayer = CAGradientLayer()
//              gradient.colors = [UIColor(red: 248, green: 174, blue: 90).cgColor, UIColor(red: 233, green: 144, blue: 42).cgColor]
//              gradient.locations = [0.0 , 1.0]
//              gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//              gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//              gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//              self.topGradientBG.layer.insertSublayer(gradient, at: 0)
//    }
//
//}
