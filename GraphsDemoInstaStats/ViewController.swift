//
//  ViewController.swift
//  GraphsDemoInstaStats
//
//  Created by Sumit Ghosh on 15/03/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var valueX = DataModel.x
    var valueY = DataModel.y
    var lineChartEntry = [ChartDataEntry]()
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalPoints = valueX.count
        let initialPointsDisplayed = 10
        let xScale:Float = Float(totalPoints / initialPointsDisplayed);
        lineChartView.zoom(scaleX: CGFloat(xScale), scaleY: 1.0, x: 0, y: 0)
        lineChartView .moveViewToX(Double(totalPoints - initialPointsDisplayed))
        
        lineChartView.setVisibleXRangeMinimum(10)
        
        for i in 0..<valueX.count {
            let value = ChartDataEntry(x: Double(valueX[i]), y: Double(valueY[i]))
            
            lineChartEntry.append(value)
        }
        
        lineChartView.xAxis.labelTextColor = UIColor.white
        lineChartView.leftAxis.labelTextColor = UIColor.white
        lineChartView.rightAxis.labelTextColor = UIColor.white
        lineChartView.drawGridBackgroundEnabled = true
        lineChartView.rightAxis.drawAxisLineEnabled = true
        lineChartView.rightAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawAxisLineEnabled = true
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.drawAxisLineEnabled = true
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.legend.textColor = UIColor.init(red: 160, green: 164, blue: 214)
        
        
        
    
        let gradientColor = [UIColor.init(red: 160, green: 164, blue: 214).cgColor,UIColor.clear.cgColor]
        let colorLocations: [CGFloat] = [1.0,0.0]
        
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB() , colors: gradientColor as CFArray, locations: colorLocations)else {print("gradient error"); return}
        
        
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number")
        line1.colors = [UIColor.init(red: 160, green: 164, blue: 214)]
        line1.drawCirclesEnabled = true
        line1.drawValuesEnabled = false
        line1.lineWidth = 3.0;
        line1.drawFilledEnabled = true
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.circleColors = [UIColor.init(red: 160, green: 164, blue: 214)]
        line1.circleHoleColor = UIColor.init(red: 160, green: 164, blue: 214)
        line1.circleRadius = 6.0
        
        let data = LineChartData()
        data.addDataSet(line1)
        
        lineChartView.data = data
        lineChartView.chartDescription?.text = "Insta-Stats"
        lineChartView.chartDescription?.textColor = UIColor.init(red: 160, green: 164, blue: 214)
        lineChartView.gridBackgroundColor = UIColor.clear
        lineChartView.animate(xAxisDuration: 2, easingOption: ChartEasingOption.easeInBounce)
        lineChartView.backgroundColor = UIColor.init(red: 20, green: 17, blue: 50)
        
        
        
    }

    @IBAction func proceedButtonAction(_ sender: Any) {
        let barGraph = BarGraphViewController()
        self.present(barGraph, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

