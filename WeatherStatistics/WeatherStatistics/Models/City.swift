//
//  City.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

struct City {
    var name: String
    var location: CityLocations
    
    init(name: String, locations: CityLocations) {
        self.name = name
        self.location = locations
    }
}
