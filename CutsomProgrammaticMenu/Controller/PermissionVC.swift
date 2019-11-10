//
//  PermissionVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/19/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class PermissionVC:BaseMenuVC,UITextViewDelegate
{
    var selectFromDateView = UIView()
    var selectToDateView = UIView()
    var startTime = UIView()
    var endTime = UIView()
    var permissionTypeView = UIView()
    
    lazy var remarksTextView:UITextView = {
        let txt = UITextView()
        txt.delegate = self
        txt.text = "Remarks"
        txt.textColor = UIColor.lightGray
        return txt
    }()
    
    let submitButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit".localized(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .headerControllerOrange
        button.anchorToView(size: .init(width:160,height:40))
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    var parentStack:UIStackView = UIStackView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitleView(title: "Permssion", comparedTo: darkFillView)
        
        view.backgroundColor = .permissionBGColor
        
        setupPermissionVCViews()
        
        setupTextFieldView()
        
        addSubmitButton()
        
        addGestureRecognizers()
    }
    
    fileprivate func addGestureRecognizers()
    {
        selectFromDateView.isUserInteractionEnabled = true
        selectFromDateView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fromDateButtonPressed)))
        selectToDateView.isUserInteractionEnabled = true
        selectToDateView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toDateButtonPressed)))
        startTime.isUserInteractionEnabled = true
        startTime.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fromTimeButtonPressed)))
        endTime.isUserInteractionEnabled = true
        endTime.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endTimeButtonPressed)))
        
    }
    
    @objc func fromDateButtonPressed()
    {
        print("from date button pressed")
    }
    
    @objc func toDateButtonPressed()
    {
        print("to date button pressed")
    }
    
    @objc func fromTimeButtonPressed()
    {
        print("from time button pressed")
    }
    
    @objc func endTimeButtonPressed()
    {
        print("end time button pressed")
    }
    
    fileprivate func addSubmitButton()
    {
        view.insertSubview(submitButton, belowSubview: darkFillView)
        submitButton.anchorToView(top: remarksTextView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0), centerH: true)//, centerV: <#T##Bool?#>)
    }
    fileprivate func setupTextFieldView()
    {
        view.insertSubview(remarksTextView, belowSubview: darkFillView)
        remarksTextView.anchorToView(top: parentStack.bottomAnchor, leading: parentStack.leadingAnchor, bottom: nil, trailing: parentStack.trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 108))
    }
    fileprivate func setupPermissionVCViews()
    {
        
        selectFromDateView = getASelectionView(image:#imageLiteral(resourceName: "small-calendar"), text: "Start Date")
        
        selectToDateView = getASelectionView(image: #imageLiteral(resourceName: "small-calendar"), text: "End Date")
        
        startTime = getASelectionView(image: #imageLiteral(resourceName: "clock"), text: "Start Time")
        
        endTime = getASelectionView(image: #imageLiteral(resourceName: "clock"), text: "End Time")
        
        selectToDateView.isUserInteractionEnabled = true
        
        selectFromDateView.isUserInteractionEnabled = true
        
        let stackDates = UIStackView(arrangedSubViews: [selectFromDateView
            ,selectToDateView
            ], axis: .horizontal, spacing: 8)
        stackDates.distribution = .fillEqually
        
        
        let stackTimes = UIStackView(arrangedSubViews: [startTime
            ,endTime
            ], axis: .horizontal, spacing: 8)
        stackTimes.distribution = .fillEqually
        
        permissionTypeView = setupPermissionTypeView()
        
        parentStack = UIStackView(arrangedSubViews: [
            stackDates,stackTimes,
            permissionTypeView,
            ], axis: .vertical, spacing: 24)
        
        parentStack.distribution = .fillEqually
        
        view.insertSubview(parentStack, belowSubview: darkFillView)
        
        parentStack.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 74, left: 10, bottom: 0, right: 10), size:
            .init(width: 0, height: (40 * 3) + (24 * 2) )
        )
        
        setupArrowView(stack: stackDates)
        setupArrowView(stack: stackTimes)
        
    }
    fileprivate func setupPermissionTypeView() -> UIView
    {
        let chevronDownImage = UIImageView(image: #imageLiteral(resourceName: "chevron-thin-down"))
        permissionTypeView.addSubview(chevronDownImage)
        chevronDownImage.anchorToView(top: nil, leading: nil, bottom: nil, trailing: permissionTypeView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 28, height: 15), centerH: nil, centerV: true)
        permissionTypeView.backgroundColor = .white
        return permissionTypeView
        
    }
    fileprivate func getASelectionView(image:UIImage,text:String) -> UIView
    {
        let selectDateView = UIView()
        
        let imageIcon = UIImageView(image: image)
        
        imageIcon.anchorToView(size:.init(width: 15, height: 15))
        
        let label = UILabel()
        
        label.text = text
        
        label.textColor = .headerLabelColor
        
        let someStack = UIStackView(arrangedSubViews: [imageIcon,label], axis: .horizontal, spacing: 24, alignment: .center)
        
        selectDateView.addSubview(someStack)
        
        someStack.anchorToView(centerH: true, centerV: true)
        
        selectDateView.backgroundColor = .white
        
        return selectDateView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [selectFromDateView,selectToDateView,startTime,endTime,remarksTextView,permissionTypeView].forEach { (v) in
            let shadowPath = UIBezierPath(rect: v.bounds)
            
            v.layer.masksToBounds = false
            
            v.layer.shadowColor = UIColor.black.cgColor
            
            v.layer.shadowOffset = CGSize(width: 0, height: 0.7)
            
            v.layer.shadowOpacity = 0.3
            
            v.layer.shadowPath = shadowPath.cgPath
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Remarks"
            textView.textColor = UIColor.lightGray
        }
    }
    fileprivate func setupArrowView(stack:UIStackView)
    {
        let dummyView = UIView()
        
        dummyView.anchorToView(size:.init(width: 30, height:30))
        
        dummyView.layer.cornerRadius = 15
        
        dummyView.clipsToBounds = true
        
        dummyView.backgroundColor = .white
        
        dummyView.layer.borderColor = UIColor.lightGray.cgColor
        
        dummyView.layer.borderWidth = 2
        
        let image = UIImageView(image: #imageLiteral(resourceName: "ic_arrow_back_24px").withRenderingMode(.alwaysOriginal))
        
        image.anchorToView(size:.init(width: 15, height: 15))
        dummyView.addSubview(image)
        image.anchorToView(centerH:true,centerV:true)
        view.insertSubview(dummyView, belowSubview: darkFillView)
        dummyView.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        dummyView.centerYAnchor.constraint(equalTo: stack.centerYAnchor).isActive = true
        
    }
}
