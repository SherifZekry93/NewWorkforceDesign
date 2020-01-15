//
//  CalendarVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/22/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

import FSCalendar
import ProgressHUD
class CalendarVC:BaseMenuVC
{
    fileprivate var timer:Timer?

    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    fileprivate let secondFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

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
            
        ], axis: .vertical, spacing: 20,alignment:.center)
        
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
        calendar.delegate = self
        calendar.dataSource = self

        super.viewDidLoad()
        
        setupTitleView(title: "calendar", comparedTo: darkFillView)
        
        setupCalendarViews()
        
        setupCalendar()
        
        setTitleLabel()
        
        setupStatisticsView()
        calendarOpenerView.isUserInteractionEnabled = false
        getCurrentEmployeeAttendance()
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
        calendar.anchorToView(top: dummyHeaderView.bottomAnchor, leading: dummyHeaderView.leadingAnchor, bottom: nil, trailing: dummyHeaderView.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10),size:.init(width: 0, height: view.frame.height / 2))
        self.calendar.calendarWeekdayView.backgroundColor = .calendarHeaderView
        self.calendar.calendarWeekdayView.layer.cornerRadius = 20
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.headerTitleColor = .innerCircleColor
        view.backgroundColor = .permissionBGColor
    }
    private func setupStatisticsView()
    {
        view.insertSubview(calendarStatisticsView, belowSubview: darkFillView)
        calendarStatisticsView.anchorToView(top: calendar.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size: .init(width: 0, height: (view.frame.height / 2 ) - 250))
    }
    private func getStackStatistics(txtColor:UIColor,statString:String,statNumber:String) -> UIView
    {
        let statLabel = UILabel()
        
        let attributed = NSMutableAttributedString(string: "•", attributes: [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize:  30),
            NSAttributedString.Key.foregroundColor:txtColor
        ])
        
        attributed.append(NSAttributedString(string: "\(statString)\n", attributes: [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18),
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
    var absecntDays:[String] = [String]()
    var weekEndDays:[String] = [String]()
    var privateHoliday:[String] = [String]()
    var publicHoliday:[String] = [String]()
    var attendedDays:[String] = [String]()
    fileprivate func getCurrentEmployeeAttendance()
    {
        ProgressHUD.show()
        self.absecntDays.removeAll()
        self.weekEndDays.removeAll()
        self.privateHoliday.removeAll()
        self.publicHoliday.removeAll()
        self.attendedDays.removeAll()
        let currentPageDate = calendar.currentPage
        
        
        let month = Calendar.current.component(.month, from: currentPageDate)
        
        let year = Calendar.current.component(.year, from: currentPageDate)
         do
        {
            var finalURL = Utility.getFinalURL(methodName: "GetEmpAttendCalender")
            finalURL.append("?empId=\(1)&month=\(month)&year=\(year)")
            let header = ["Authorization":"Bearer \(NewUser.getLocallySavedUser()?.token ?? "")","Content-Type":"application/json; charset=utf-8"]
            Service.shared.fetchGenericJSONData(urlString: finalURL, parameters: nil, header: header) { (result:Array<NewAttendance>?, err:Error?) in
            //print(result)

            if err != nil && result != nil
            {
                ProgressHUD.showError(err?.localizedDescription ?? "")
                return
            }
            print(result)
            result?.forEach({ (attend) in

                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                if let date = dateFormatter.date(from: attend.transactionDate ?? "")
                {
                    let newDate = self.formatter.string(from: date)
                    print(newDate)
                    
                    if attend.statusId == 103
                    {
                        self.absecntDays.append(newDate)
                    }
                    else if attend.statusId == 110
                    {
                        self.weekEndDays.append(newDate)
                    }
                    else if attend.statusId == 104
                    {
                        self.privateHoliday.append(newDate)
                    }
                    else if attend.statusId == 105
                    {
                        self.publicHoliday.append(newDate)
                    }
                    else
                    {
                        self.attendedDays.append(newDate)
                    }

                }
            })
                
            DispatchQueue.main.async {
                self.calendar.reloadData()
                ProgressHUD.dismiss()
            }
        }
           }
           catch let err
          {
              ProgressHUD.showError(err.localizedDescription)
              return
         }
    }

}
extension CalendarVC:FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance
{
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateString : String = formatter.string(from:date)
        print(absecntDays)
        print(dateString)
        
        if absecntDays.contains(dateString)
        {
            return UIColor.red
        }
        else if weekEndDays.contains(dateString)
        {
            return UIColor.blue
        }
        else if privateHoliday.contains(dateString)
        {
            return UIColor(red: 204/255, green: 204/255, blue: 0/255, alpha: 1)
        }
        else if publicHoliday.contains(dateString)
        {
            return .purple
        }
        else if attendedDays.contains(dateString)
        {
            return UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        }
        else{
            return nil
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateString : String = formatter.string(from:date)
        print(dateString)
        print(absecntDays)
        if absecntDays.contains(dateString)
        {
            return .white
        }
        else if weekEndDays.contains(dateString)
        {
            return .white
        }
        else if privateHoliday.contains(dateString)
        {
            return .white
        }
        else if publicHoliday.contains(dateString)
        {
            return .white
        }
        else if attendedDays.contains(dateString)
        {
            return .white
        }
        else{
            return nil
        }
    }
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        ProgressHUD.show("Loading Attendance")
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {[weak self] (_) in
            self?.getCurrentEmployeeAttendance()
        })
    }

}
