//
//  WeatherСhartViewСontroller.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import Material
import Charts

class WeatherСhartViewСontroller: UIViewController, WeathrStatisticProtocol {
    @IBOutlet var tmaxChartButton: UIButton!
    @IBOutlet var tminChartButton: UIButton!
    @IBOutlet var anuarRainChartButton: UIButton!
    
    var city: City?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.preparePageTabBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? WeathrStatisticProtocol else { return }
        controller.city = self.city
    }
}

extension WeatherСhartViewСontroller {
    fileprivate func preparePageTabBarItem() {
        pageTabBarItem.titleColor = Color.blueGrey.darken4
        pageTabBarItem.title = "Сharts"
    }
}
