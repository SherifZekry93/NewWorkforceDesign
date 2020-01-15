//
//  PieChartCell.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/14/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import Charts
class PieChartCell: UICollectionViewCell {
    
    
    lazy var  pieChartVC : PieChartViewController = PieChartViewController()
    
    let separator:UIView = {
        let v = UIView()
        v.backgroundColor = .cvBG
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupviews()
    {
        let finalView = pieChartVC.view ?? UIView()
        addSubview(finalView)
        finalView.fillSuperView()
        addSubview(separator)
        separator.anchorToView(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 25, bottom: 0, right: 25), size: .init(width: 0, height: 1.5))
    }
    
}

class PieChartViewController: DemoBaseViewController {

    let chartView: PieChartView = {
        let v = PieChartView()
        
        return v
    }()
    //@IBOutlet var sliderX: UISlider!
    //@IBOutlet var sliderY: UISlider!
    //@IBOutlet var sliderTextX: UITextField!
    //@IBOutlet var sliderTextY: UITextField!
    private func setData()
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0

        let absenceString = ["Absent","Permission","Attendance"]
        let percentageArray = [1,2,3];
        let ys1 = percentageArray.map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
        
        let yse1 = ys1.enumerated().map { x, y in
            return PieChartDataEntry(value: Double(percentageArray[x]), label: absenceString[x])
        }
        
        //: ### PieChartDataSet
        let ds1 = PieChartDataSet(entries: yse1, label: "")
        ds1.colors = ChartColorTemplates.vordiplom()
        //: ### PieChartData
        let data = PieChartData()
        data.setValueFont(.boldSystemFont(ofSize: 18))
        ds1.colors = [.redCircleText,.headerControllerOrange,.chartGreen];
        
        data.addDataSet(ds1)
        
        chartView.data = data
        chartView.data?.setValueFormatter(DefaultValueFormatter(formatter:formatter))
//        chartView.setValueFormatter(DefaultValueFormatter(formatter:formatter))

        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview(chartView)
        chartView.fillSuperView()
        setData()
        // Do any additional setup after loading the view.
        self.title = "Pie Chart"
        
        self.options = [.toggleValues,
                        .toggleXValues,
                        .togglePercent,
                        .toggleHole,
                        .toggleIcons,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .spin,
                        .drawCenter,
                        .saveToGallery,
                        .toggleData]
        
        self.setup(pieChartView: chartView)
        
        chartView.delegate = self
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
//        chartView.legend = l

        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        //sliderX.value = 4
        //sliderY.value = 100
        self.slidersValueChanged(nil)
        
        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
       // self.setDataCount(Int(sliderX.value), range: UInt32(sliderY.value))
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count],
                                     icon: #imageLiteral(resourceName: "icon"))
        }
        
        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.white)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
    override func optionTapped(_ option: Option) {
        switch option {
        case .toggleXValues:
            chartView.drawEntryLabelsEnabled = !chartView.drawEntryLabelsEnabled
            chartView.setNeedsDisplay()
            
        case .togglePercent:
            chartView.usePercentValuesEnabled = !chartView.usePercentValuesEnabled
            chartView.setNeedsDisplay()
            
        case .toggleHole:
            chartView.drawHoleEnabled = !chartView.drawHoleEnabled
            chartView.setNeedsDisplay()
            
        case .drawCenter:
            chartView.drawCenterTextEnabled = !chartView.drawCenterTextEnabled
            chartView.setNeedsDisplay()
            
        case .animateX:
            chartView.animate(xAxisDuration: 1.4)
            
        case .animateY:
            chartView.animate(yAxisDuration: 1.4)
            
        case .animateXY:
            chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
            
        case .spin:
            chartView.spin(duration: 2,
                           fromAngle: chartView.rotationAngle,
                           toAngle: chartView.rotationAngle + 360,
                           easingOption: .easeInCubic)
            
        default:
            handleOption(option, forChartView: chartView)
        }
    }
    
    // MARK: - Actions
    @IBAction func slidersValueChanged(_ sender: Any?) {
        //sliderTextX.text = "\(Int(sliderX.value))"
        //sliderTextY.text = "\(Int(sliderY.value))"
        
        self.updateChartData()
    }
}
