//
//  CalendarVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/22/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

import FSCalendar

class CalendarVC:BaseMenuVC
{
    let calendar:FSCalendar = {
        let ca = FSCalendar()
        return ca
    }()
    
    let dummyHeaderView = UIView()
    
    lazy var calendarStatisticsView:UIStackView  = {
        
        let firstStack = UIStackView(arrangedSubviews: [
            getStackStatistics(txtColor: .redMessageColor, statString: "Absent", statNumber: "12"),
            getStackStatistics(txtColor: .greenMessageColor, statString: "Attend", statNumber: "12"),
            getStackStatistics(txtColor: .statisticsOrangeText, statString: "Weekend", statNumber: "12")
        ])
        firstStack.distribution = .fillEqually
        
        firstStack.spacing = 45
        
        let secondStack = UIStackView(arrangedSubviews: [
            getStackStatistics(txtColor: .blueCircleText, statString: "Public-Holiday", statNumber: "12"),
            getStackStatistics(txtColor: .headerControlllerBlue, statString: "Private-Holiday", statNumber: "12"),
            ])
        
        secondStack.spacing = 45
        
        secondStack.distribution = .fillEqually
        
        let stack = UIStackView(arrangedSubViews: [
            
            firstStack,
            
            secondStack
            
        ], axis: .vertical, spacing: 12,alignment:.center)
        
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    let calendarHeaderLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = -1
        label.font = UIFont(name: "Raleway-SemiBold", size: 12)
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitleView(title: "calendar", comparedTo: darkFillView)
        
        setupCalendarViews()
        
        setupCalendar()
        
        setTitleLabel()
        
        setupStatisticsView()
    }
    private func setTitleLabel()
    {
        //        calendarTitleLbl.text = "calendar".localized()
        let inputDateAsString = Date()//"2016-03-09 10:33:59"
        let formatter = DateFormatter()
        
        if getAppLanguage() == "ar"
        {
            //formatter.dateFormat = "yyyy\ndd MMMM , EEEE"
            if let date = formatter.date(from: formatter.string(from: inputDateAsString)) {
                
                formatter.locale = NSLocale(localeIdentifier: "ar") as Locale
                
                formatter.dateFormat = "yyyy\ndd MMMM , EEEE"
                
                let outputDate = formatter.string(from: date)
                
                calendarHeaderLabel.text = outputDate
            }
        }
        else
        {
            formatter.dateFormat = "yyyy\ndd MMMM , EEEE"
            
            let currentDateString: String = formatter.string(from: inputDateAsString)
            
            calendarHeaderLabel.text = currentDateString
        }
        calendarHeaderLabel.font = UIFont(name: "Raleway-SemiBold", size: 15)
    }
    private func setupCalendarViews()
    {
        dummyHeaderView.backgroundColor = .calendarHeaderView
        dummyHeaderView.addSubview(calendarHeaderLabel)
        calendarHeaderLabel.anchorToView(top: nil, leading: dummyHeaderView.leadingAnchor, bottom: nil, trailing: dummyHeaderView.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12), centerH: nil, centerV: true)
        view.insertSubview(dummyHeaderView, belowSubview: darkFillView)
        dummyHeaderView.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 61.2))
    }
    private func setupCalendar()
    {
        view.insertSubview(calendar, belowSubview: darkFillView)
        calendar.anchorToView(top: dummyHeaderView.bottomAnchor, leading: dummyHeaderView.leadingAnchor, bottom: nil, trailing: dummyHeaderView.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10),size:.init(width: 0, height: 500))
        self.calendar.calendarWeekdayView.backgroundColor = .calendarHeaderView
        self.calendar.calendarWeekdayView.layer.cornerRadius = 20
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.headerTitleColor = .innerCircleColor
        view.backgroundColor = .permissionBGColor
    }
    private func setupStatisticsView()
    {
        view.insertSubview(calendarStatisticsView, belowSubview: darkFillView)
        calendarStatisticsView.anchorToView(top: calendar.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 50, right: 0))
    }
    private func getStackStatistics(txtColor:UIColor,statString:String,statNumber:String) -> UIView
    {
        let statLabel = UILabel()
        
        let attributed = NSMutableAttributedString(string: "• ", attributes: [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize:  30),
            NSAttributedString.Key.foregroundColor:txtColor
        ])
        
        attributed.append(NSAttributedString(string: "\(statString)\n", attributes: [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor:UIColor.headerLabelColor
        ]))
        
        attributed.append(NSAttributedString(string: "\(statNumber)", attributes: [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:txtColor
        ]))
        
        statLabel.numberOfLines = -1
        
        statLabel.attributedText = attributed

        statLabel.textAlignment = .center
        
        statLabel.backgroundColor = .white
        
        return statLabel
    }
}
