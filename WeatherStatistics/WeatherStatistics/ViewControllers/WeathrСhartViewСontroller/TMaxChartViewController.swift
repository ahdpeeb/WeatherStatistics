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
        
        self.setTmaxChart()
    }
    
    //MARK: Actions
    
    @IBAction func exitButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func maxChartViewConfig() {
        barChartView.chartDescription?.text = "Maximum temperatures indicators"
        barChartView.backgroundColor = UIColor.white
    }
    
    func setTmaxChart() {
//        guard let seletedCity = city else { return }
        let years: [Double] = [1.0, 2.2, 3.3, 4.5, 5.0, 6.0]
            //seletedCity.years.flatMap({ Double($0.year) })
//        print(years)
        let anuarlTMax: [Double] = [10.3, 20.2, 30.4, 40.5, 50.6, 60.7] //seletedCity.years.flatMap({ Double($0.anualTmax) })
//        print(anuarlTMax)
        
        var dataEntries: [BarChartDataEntry] = []
        
        for inx in 0 ..< years.count {
            let dataEntry = BarChartDataEntry(x:  years[inx], yValues: [anuarlTMax[inx]])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Temperature indicators")
        chartDataSet.colors = ChartColorTemplates.pastel()
        chartDataSet.valueTextColor = UIColor.black
        
        let charData = ChartData(dataSet: chartDataSet)
        
        barChartView.data = charData
    }

}
