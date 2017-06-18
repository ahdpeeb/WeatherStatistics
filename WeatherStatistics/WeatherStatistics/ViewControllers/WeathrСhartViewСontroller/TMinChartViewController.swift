//
//  TMixChartViewController.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/18/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import Charts

class TMinChartViewController: UIViewController, WeathrStatisticProtocol {
    var city: City?
    
    @IBOutlet var chartView: LineChartView!
    @IBOutlet var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mixChartViewConfig()
        self.updateChartView()
    }
    
    @IBAction func exitButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func mixChartViewConfig() {
        chartView.chartDescription?.text = "Minimum temperatures indicators"
        chartView.backgroundColor = UIColor.white
        chartView.xAxis.labelPosition = .bottom
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.drawGridBackgroundEnabled = false
    }
    
    func updateChartView() {
        guard let seletedCity = city else { return }
        var dataEntries: [ChartDataEntry] = []

        let years: [Double] = seletedCity.years.flatMap({ Double($0.year) })
        let anuarlTMin: [Double] = seletedCity.years.flatMap({ Double($0.anualTmin) })
        
        for i in 0 ..< years.count {
            let dataEntry = ChartDataEntry(x: years[i], y: anuarlTMin[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Minimum temperature statistic")
        chartDataSet.colors = ChartColorTemplates.joyful()
        
        let chartData = LineChartData(dataSet: chartDataSet)
        chartView.data = chartData
    }
}
