//
//  YearStatistic.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

class YearStatistic {
    var year: Int
    var mounthStatistic: [MonthStatistic] = []
    var statisticVisible = false
    
    init(year: Int) {
        self.year = year
    }
}

extension YearStatistic: Equatable {
    public static func ==(lhs: YearStatistic, rhs: YearStatistic) -> Bool {
        return lhs.year == rhs.year
    }
}
