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
    var isContentVisible = true
    
    init(year: Int) {
        self.year = year
    }
    
    //MARK: Computed properties 
    
    var anualTmax: Float { return self.annualRate(rates: mounthStatistic.flatMap({ $0.tmax })) }
    var anualTmin: Float { return self.annualRate(rates: mounthStatistic.flatMap({ $0.tmin })) }
    var anualRainMM: Float { return self.annualRate(rates: mounthStatistic.flatMap({ $0.rainMM })) }
    
    private func annualRate(rates: [Float]) -> Float {
        let count = Float(rates.count)
        let rateSumm = rates.reduce(0, +)
        return (rateSumm / count)
    }
}

extension YearStatistic: Equatable {
    public static func ==(lhs: YearStatistic, rhs: YearStatistic) -> Bool {
        return lhs.year == rhs.year
    }
}


