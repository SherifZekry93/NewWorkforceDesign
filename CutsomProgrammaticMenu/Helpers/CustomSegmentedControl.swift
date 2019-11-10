//
//  CustomSegmentedControl.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/15/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import MOLH
class CustomSegmentedControl: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        semanticContentAttribute = .forceLeftToRight
        selectedSegmentIndex = MOLHLanguage.currentAppleLanguage() == "en" ? 0 : 1
    }
    
    var viewsUpdated = false
    
    override func layoutSubviews() {
        if !viewsUpdated
        {
            viewsUpdated = true
            updateView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var buttons:[UIButton] = [UIButton]()
    
    var selector:UIView!
    
    var selectedSegmentIndex = MOLHLanguage.currentAppleLanguage() == "en" ? 0 : 1
    
    var boroderWidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = boroderWidth
        }
    }
    
    var borderColor:UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    var commaSeparatorButtonLines:String = ""
    {
        didSet{
            updateView()
        }
    }
    
    var textColor:UIColor = .orange{
        didSet{
            updateView()
        }
    }
    
    var selectorColor:UIColor = .orange {
        didSet{
            updateView()
        }
    }
    
    var selectorTextColor:UIColor = .white {
        didSet{
            updateView()
        }
    }
    
    func updateView()
    {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview()
        }
        let buttonTitles = commaSeparatorButtonLines.components(separatedBy: ",")
        for buttonTitle in buttonTitles
        {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped)
                , for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        
        let selectorPosition = frame.width / CGFloat(buttons.count) * CGFloat(selectedSegmentIndex)

        selector = UIView(frame: .init(x: selectorPosition, y: 0, width: selectorWidth, height: frame.height))
        
        selector.backgroundColor = selectorColor
        
        addSubview(selector)
        
        selector.layer.cornerRadius = frame.height / 2
        
        let sv = UIStackView(arrangedSubviews: buttons)
        
        sv.axis = .horizontal
        
        sv.alignment = .fill
        
        sv.distribution = .fillEqually
        sv.semanticContentAttribute = .forceLeftToRight
        addSubview(sv)
        
        sv.fillSuperView()
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }
    
    @objc func buttonTapped(button:UIButton)
    {
        for (btnIndex,btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button
            {
                let selectorPosition = frame.width / CGFloat(buttons.count) * CGFloat(btnIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorPosition
                }
                selectedSegmentIndex = btnIndex
                btn.setTitleColor(selectorTextColor, for: .normal)
                handleDifferentSelection(index: btnIndex)
            }
        }
    }
    
    func selectedIndex() -> Int
    {
        
        return selectedSegmentIndex
        
    }
    
    fileprivate func handleDifferentSelection(index:Int)
    {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // Put your code which should be executed with a delay here
            if index == 0 && getAppLanguage() != "en"
            {
                
                MOLH.setLanguageTo("en")
                MOLH.reset()
                
            }
            else if  index == 1 && getAppLanguage() != "ar"
            {
                
                MOLH.setLanguageTo("ar")
                MOLH.reset()
                
            }

        }

    }
}
