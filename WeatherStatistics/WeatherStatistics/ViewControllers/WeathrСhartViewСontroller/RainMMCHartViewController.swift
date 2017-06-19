//
//  SunH.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/19/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import Charts

class RainMMCHartViewController: UIViewController, WeathrStatisticProtocol {

    var city: City?
    
    @IBOutlet var chartView: BubbleChartView!
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
        chartView.chartDescription?.text = "Rain downfall indicators"
        chartView.backgroundColor = UIColor.white
        chartView.xAxis.labelPosition = .bottom
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.drawGridBackgroundEnabled = false
    }
    
    func updateChartView() {
        guard let seletedCity = city else { return }
        var dataEntries: [BubbleChartDataEntry] = []
        
        let years: [Double] = seletedCity.years.flatMap({ Double($0.year) })
        let anuarRainMM: [Double] = seletedCity.years.flatMap({ Double($0.anualRainMM) })
        
        for i in 0 ..< years.count {
            let size: CGFloat = CGFloat(anuarRainMM[i] * 5.0)
            let dataEntry = BubbleChartDataEntry(x: years[i], y: anuarRainMM[i], size: size)
            dataEntries.append(dataEntry)
        }
        
        let dataSet = BubbleChartDataSet(values: dataEntries, label: "Rain downfall statistic")
        dataSet.colors = ChartColorTemplates.colorful()
        
        let chartData = BubbleChartData(dataSets: [dataSet])
        
        chartView.data = chartData
    }

}
