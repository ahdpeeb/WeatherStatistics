//
//  DataParser.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/14/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

class DataParser {    
    var sourceString: String
    
    init(sourceString: String) {
        self.sourceString = sourceString
    }
    
    //MARK: Prefetching data
    
     private func cityLocationRaw() -> String? {
        guard let lowerBound = sourceString.range(of: "Location")?.lowerBound,
            let upperBounds = sourceString.range(of: "Estimated")?.lowerBound else { return nil }
        return sourceString.substring(with: lowerBound..<upperBounds)
    }
    
    private func cityWeatherStatisticRaw() -> String? {
        guard let upperBound = sourceString.range(of: "hours\n")?.upperBound else { return nil }
        return sourceString.substring(from: upperBound)
    }
    
    private func cityWeatherComponents() -> [String]? {
        guard let yearsRawString = self.cityWeatherStatisticRaw() else { return nil }
        
        let conponents = yearsRawString.replacingOccurrences(of: "*", with: "")
            .replacingOccurrences(of: " Provisional", with: "")
            .components(separatedBy: "\n")
        
        return conponents
    }
    
    //MARK: Parsing Data
    
    private func yearsStatistic() -> [YearStatistic]? {
        guard let stringComponents = self.cityWeatherComponents() else { return nil }
        var buffer: [YearStatistic] = []
        stringComponents.forEach { stringComponent in
            let weatherDataComponents = stringComponent.components(separatedBy: " ").filter({ !$0.isEmpty })
            if let year = self.yearForm(components: weatherDataComponents),
               let month = self.monthFrom(components: weatherDataComponents) {
                if let existingIndex = buffer.index(of: year) {
                    buffer[existingIndex].mounthStatistic.append(month)
                } else {
                    year.mounthStatistic.append(month)
                    buffer.append(year)
                }
            }
        }
        
        return buffer
    }
    
    private func yearForm(components: [String]) -> YearStatistic? {
        guard components.count > 0 else { return nil }
        return Int(components[0]).map({ YearStatistic(year: $0) })
    }
    
    private func monthFrom(components: [String]) -> MonthStatistic? {
        guard components.count > 0 else { return nil }
        let month = Int(components[1])
        let tmax = Float(components[2])
        let tmin = Float(components[3])
        let days = Float(components[4])
        let rainMM = Float(components[5])
        let sunH = Float(components[6])
        return MonthStatistic(month: month, tmax: tmax, tmin: tmin, days: days, rainMM: rainMM, sunH: sunH)
    }
    
    //MARK: Models Parsing
    
    private func cityName() -> String? {
        return sourceString.range(of: "\n")
            .map({ sourceString.substring(to: $0.upperBound).removeLastChar() })
    }
    
    private func parseLocation() -> CityLocations? {
        guard let locationsString = self.cityLocationRaw() else { return nil }
        
        let components = locationsString.components(separatedBy: ",")
        let locationComponents = components[1].components(separatedBy: " ")
        
        let altitude = components[2].components(separatedBy: " ")[1]
        let latitude = locationComponents[2]
        let longiture = locationComponents[4]
        
        let location = CityLocations(latitude: latitude, longitude: longiture, altitude: altitude)
        return location
    }
    
    //MARK: Public

    public func city() -> City? {
        guard   let locaiton = self.parseLocation(),
                let name = self.cityName(),
                let statistic = self.yearsStatistic() else { return nil }
        let city = City(name: name, locations: locaiton)
        city.years = statistic
        
        return city
    }
}

