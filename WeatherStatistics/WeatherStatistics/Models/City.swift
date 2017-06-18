//
//  City.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

class City: NSObject {
    var name: String
    var location: CityLocations
    var years: [YearStatistic] = []
    
    init(name: String, locations: CityLocations) {
        self.name = name
        self.location = locations
    }
}
