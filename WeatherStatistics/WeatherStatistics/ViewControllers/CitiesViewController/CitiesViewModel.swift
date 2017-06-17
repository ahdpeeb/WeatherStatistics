//
//  CitiesViewModel.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/14/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CitiesViewModel {
    
    //MARK: OutGoing
    public var cities = Variable<[CitySourceData]>([])
    
    //MARK: Private
    
    public let disposeBag = DisposeBag()
    private lazy var sourcecCities: [CitySourceData] = CitySourceData.cities()!
    let scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background)

    init(seachText: Variable<String>) {
        seachText.asObservable()
        .subscribeOn(scheduler)
//        .debounce(0.3)
        .distinctUntilChanged()
        .map { serchText -> [CitySourceData] in
            guard !serchText.isEmpty else { return self.sourcecCities }
            return self.sourcecCities.filter({ $0.name.localizedCaseInsensitiveContains(serchText) })
        }
        .asDriver(onErrorJustReturn: [])
        .drive(cities)
        .addDisposableTo(disposeBag)
    }
}

