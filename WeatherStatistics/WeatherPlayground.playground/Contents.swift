//: Playground - noun: a place where people can play



@testable import WeatherStatistics
import UIKit
import RxSwift
import RxAlamofire
import RxCocoa

let diposeBag = DisposeBag()

let testCity = CitySourceData(name: "Bradford", url: "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")

//DataParser.loadWeather(city: testCity)
//    .asObservable()
//    .subscribe(onNext: { resnponce in
//        print(resnponce)
//    }, onError: { (error) in
//        print(error)
//    }).addDisposableTo(diposeBag)
//
//data(.get, "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")
//    .asObservable()
//    .map({ (date) -> String in
//        return String(bytes: date, encoding: .utf8)!
//    })


