//
//  CityLocations.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

struct CityLocations {
    var latitude: String
    var longitude: String
    var altitude: String
    
    init(latitude: String, longitude: String, altitude: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
    }
}
