//
//  File.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

struct NetworkManager {
    static func loadWeatherFor(city: CitySourceData) -> Observable<String?> {
        guard let url = city.url else { return Observable.just(nil) }
        return requestString(.get, url)
            .map({ $0.1 })
    }

}
