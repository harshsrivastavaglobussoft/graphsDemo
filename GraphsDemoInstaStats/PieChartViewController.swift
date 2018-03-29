//
//  PieChartViewController.swift
//  GraphsDemoInstaStats
//
//  Created by Sumit Ghosh on 24/03/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {

    @IBOutlet var pieChartView: PieChartView!
    var pieData:Array! = DataModel.piechartdata
    var pieLegend:Array! = DataModel.pielegend
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillChart()
    }
    func fillChart() {
        var dataEntries = [PieChartDataEntry]()
        var TotalString = ""
        var total = 0
        
        for i in 0..<self.pieData.count {
            let entry = PieChartDataEntry(value: Double(self.pieData[i]), label: self.pieLegend[i])
            total = total + self.pieData[i]
            TotalString = String(total)
            dataEntries.append(entry)
        }
        
        
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "Insta-Stats")
        chartDataSet.colors = ChartColorTemplates.material()
        chartDataSet.sliceSpace = 2
        chartDataSet.selectionShift = 5
    
        let chartData = PieChartData(dataSet: chartDataSet)
        
        pieChartView.data = chartData
        
        pieChartView.centerText = TotalString
        pieChartView.backgroundColor = UIColor.init(red: 20, green: 17, blue: 50)
        
        
        pieChartView.legend.textColor = UIColor.init(red: 160, green: 164, blue: 214)
        pieChartView.legend.font = UIFont.systemFont(ofSize: 10)
        
        pieChartView.holeColor = UIColor.init(red: 20, green: 17, blue: 50)
        
        pieChartView.animate(yAxisDuration: 3, easingOption: ChartEasingOption.easeInOutBounce)
        
        
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
