//
//  BarGraphViewController.swift
//  GraphsDemoInstaStats
//
//  Created by Sumit Ghosh on 23/03/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit
import Charts

class BarGraphViewController: UIViewController,ChartViewDelegate {
    
    @IBOutlet weak var barChartView: BarChartView!
    var valueX = DataModel.x
    var valueY = DataModel.y
    var barChartEntry = [BarChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<valueX.count {
            let dataEntry = BarChartDataEntry.init(x: Double(valueX[i]), y: Double(valueY[i]))
            
            barChartEntry.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: barChartEntry, label: "Followers")
        
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(false)
        chartDataSet.colors = [UIColor.init(red: 160, green: 164, blue: 214)]
        barChartView.data = chartData

        
        barChartView.delegate = self
        barChartView.xAxis.labelTextColor = UIColor.white
        barChartView.leftAxis.labelTextColor = UIColor.white
        barChartView.rightAxis.labelTextColor = UIColor.white
        barChartView.drawGridBackgroundEnabled = true
        barChartView.rightAxis.drawAxisLineEnabled = true
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawAxisLineEnabled = true
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = true
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.legend.textColor = UIColor.init(red: 160, green: 164, blue: 214)
        
        barChartView.chartDescription?.text = "Insta-Stats"
        barChartView.chartDescription?.textColor = UIColor.white
        barChartView.gridBackgroundColor = UIColor.clear
   
        barChartView.animate(yAxisDuration: 2, easingOption: ChartEasingOption.easeInBounce)
        barChartView.backgroundColor = UIColor.init(red: 20, green: 17, blue: 50)
        
        
        let totalPoints = valueX.count
        let initialPointsDisplayed = 10
        let xScale:Float = Float(totalPoints / initialPointsDisplayed);
        barChartView.zoom(scaleX: CGFloat(xScale), scaleY: 1.0, x: 0, y: 0)
        barChartView .moveViewToX(Double(totalPoints - initialPointsDisplayed))
    }

    
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
       print(entry)
        print(highlight)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
