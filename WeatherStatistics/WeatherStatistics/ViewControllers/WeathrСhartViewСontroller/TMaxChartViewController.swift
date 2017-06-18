//
//  TMaxChartViewController.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/18/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import Charts

class TMaxChartViewController: UIViewController, WeathrStatisticProtocol {
    var city: City?
    
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.maxChartViewConfig()
        self.updateChartView()
    }
    
    //MARK: Actions
    
    @IBAction func exitButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func maxChartViewConfig() {
        barChartView.chartDescription?.text = "Maximum temperatures indicators"
        barChartView.backgroundColor = UIColor.white
    }
    
    func updateChartView() {
        var dataEntries: [BarChartDataEntry] = []
        guard let seletedCity = city else { return }
        let years: [Double] = seletedCity.years.flatMap({ Double($0.year) })
        let anuarlTMax: [Double] = seletedCity.years.flatMap({ Double($0.anualTmax) })
        
        for i in 0..<years.count {
            let dataEntry = BarChartDataEntry(x: years[i], y: anuarlTMax[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Maximum temperature statistic")
        chartDataSet.colors = ChartColorTemplates.vordiplom()
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        barChartView.data = chartData
    }
}
