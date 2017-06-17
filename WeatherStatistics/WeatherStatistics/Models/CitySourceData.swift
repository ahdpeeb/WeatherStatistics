//
//  SourceCity.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/14/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

class CitySourceData {
    var name: String
    var url: URL?
    
    init(name: String, url: String) {
        self.name = name
        self.url = URL(string: url)
    }
    
    static func cities() -> [CitySourceData]? {
        guard let file = Bundle.main.path(forResource: "MeteorologicalStationList", ofType: ".plist"),
            let sourse = NSArray(contentsOfFile: file) else { return nil }
        
        return sourse.flatMap { any -> CitySourceData? in
            (any as? AnyDict).flatMap({ (dict) -> CitySourceData? in
                guard let name = dict["name"] as? String, let url = dict["url"] as? String else { return nil }
                return CitySourceData(name: name, url: url)
            })
        }.sorted(by: { $0.name < $1.name })
    }
}
