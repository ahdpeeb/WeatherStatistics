//: Playground - noun: a place where people can play



@testable import WeatherStatistics
import UIKit
import RxSwift
import RxAlamofire
import RxCocoa

let diposeBag = DisposeBag()

//let testCity = CitySourceData(name: "Bradford", url: "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")

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
//______________________________________________________________________________________

//let locationString = "Location 414900E 435200N, Lat 53.813 Lon -1.772, 134 metres amsl\n"
//
//let components = locationString.components(separatedBy: ",")
//let locationComponents = components[1].components(separatedBy: " ")
//
//var altitude = components[2].components(separatedBy: " ")[1]
//
//let latitude = locationComponents[2]
//let longiture = locationComponents[4]

//__________________________________________________________-
