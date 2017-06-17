//
//  MeteoData.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

struct MeteoData {
    var year: Int
    var month: Int
    var tmax: Float
    var tmin: Float
    var days: Int
    var rainMM: Float
    var sunH: Float
    
    init(year: Int, month: Int, tmax: Float, tmin: Float, days: Int, rainMM: Float, sunH: Float) {
        self.year = year
        self.month = month
        self.tmax = tmax
        self.tmin = tmin
        self.days = days
        self.rainMM = rainMM
        self.sunH = sunH
    }
}
