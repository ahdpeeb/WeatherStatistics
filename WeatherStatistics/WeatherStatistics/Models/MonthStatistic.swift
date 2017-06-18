//
//  MonthStatistic.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

class MonthStatistic {
    var month: Int?
    var tmax: Float?
    var tmin: Float?
    var days: Float?
    var rainMM: Float?
    var sunH: Float?
    
    init(month: Int?, tmax: Float?, tmin: Float?, days: Float?, rainMM: Float?, sunH: Float?) {
        self.month = month
        self.tmax = tmax
        self.tmin = tmin
        self.days = days
        self.rainMM = rainMM
        self.sunH = sunH
    }
}
