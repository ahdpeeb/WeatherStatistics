//
//  WeathrStatisticViewController.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Material

@objc protocol WeathrStatisticProtocol {
   @objc var city: City? { get set }
}

class WeathrStatisticViewController: UIViewController {
    public var sourceData: CitySourceData!
    
    private var disposeBag = DisposeBag()
    var rootView: WeathrStatisticRootView { return self.getView()! }
    private var city: City?

    private lazy var weatherListController: UIViewController = {
        return UIStoryboard.controllerFromMainStorybourd(cls: WeatherListViewController.self)
    }()
    
    private lazy var chartСontroller: UIViewController = {
        return UIStoryboard.controllerFromMainStorybourd(cls: WeatherСhartViewСontroller.self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setContentTabBarControllers()
        self.loadWeatherStatistic()
    }
    
    //MARK: Private
    
    private func loadWeatherStatistic() {
        self.rootView.isLoadingViewVisible = true
        NetworkManager.loadWeatherFor(city: self.sourceData)
            .asObservable()
            .observeOn(MainScheduler.asyncInstance)
            .map({ responce -> City? in
                let parser = responce.map({ DataParser(sourceString: $0) })
                return parser?.city()
            })
            
            .subscribe(onNext: { (city) in
                self.city = city
            }, onError: { (error) in
                self.rootView.isLoadingViewVisible = false
                self.presentErrorController(title: "Error", message: error.localizedDescription)
            }, onCompleted: {
                self.rootView.isLoadingViewVisible = false
                self.passModelToContentControllers()
            }).addDisposableTo(disposeBag)
    }
    
    fileprivate func setContentTabBarControllers() {
        let controllers = [weatherListController, chartСontroller]
        controllers.forEach({ $0.loadViewIfNeeded() })
        
        let pages = StatisticPageTabBarController(viewControllers: controllers, selectedIndex: 0)
        let viewFame = self.rootView.frameView!
        self.addChildViewControoler(pages, toContainerView: viewFame)
    }
    
    private func passModelToContentControllers() {
        [weatherListController, chartСontroller].forEach { (controller) in
            if let protocolController = controller as? WeathrStatisticProtocol {
                protocolController.city = self.city
            }
        }
    }
}
