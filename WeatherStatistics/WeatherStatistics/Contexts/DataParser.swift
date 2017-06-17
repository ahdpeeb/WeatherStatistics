//
//  DataParser.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/14/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import RxCocoa
import RxAlamofire
import Alamofire
import RxSwift

class DataParser {
    class func loadWeatherFor(city: CitySourceData) -> Observable<String?> {
        guard let url = city.url else { return Observable.just(nil) }
        return requestString(.get, url)
                .map({ $0.1 })
    }
    
    var sourceString: String
    
    init(sourceString: String) {
        self.sourceString = sourceString
    }
    
    //MARK: Prefetched data
    
    func cityName() -> String? {
        return sourceString.range(of: "\n")
            .map({ sourceString.substring(to: $0.upperBound) })
    }
    
    func cityLocationRaw() -> String? {
        guard let lowerBound = sourceString.range(of: "Location")?.lowerBound,
            let upperBounds = sourceString.range(of: "Estimated")?.lowerBound else { return nil }
        return sourceString.substring(with: lowerBound..<upperBounds)
    }
    
    func cityWeatherStatisticRaw() -> String? {
        guard let upperBound = sourceString.range(of: "hours\n")?.upperBound else { return nil }
        return sourceString.substring(from: upperBound)
    }
    
    //MARK: Models Parsing
    
    func citiWith(name: String) {
        
    }
}

