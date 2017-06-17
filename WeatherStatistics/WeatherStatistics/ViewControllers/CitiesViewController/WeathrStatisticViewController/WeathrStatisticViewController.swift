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

class WeathrStatisticViewController: UIViewController {
    public var sourceData: CitySourceData!
    
    private var disposeBag = DisposeBag()
    var rootView: WeathrStatisticRootView { return self.getView()! }
    private var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWeatherStatistic()
    }
    
    //Pri
    
    private func loadWeatherStatistic() {
        self.rootView.isLoadingViewVisible = true
        NetworkManager.loadWeatherFor(city: self.sourceData)
            .asObservable()
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
            }).addDisposableTo(disposeBag)
    }
    
//    fileprivate func setContentTabBarController() {
//        let requisites = UIStoryboard.controllerFromStorybourd("Accounts", cls: AccountRequisitesViewController.self)
//        let history = UIStoryboard.controllerFromStorybourd("Accounts", cls: AccountHistoryViewController.self)
//        let managment = UIStoryboard.controllerFromStorybourd("Accounts", cls: AccountManagementViewController.self)
//        [requisites, history, managment].forEach({ $0.loadViewIfNeeded() })
//        
//        history.bottomInset!
//            .distinctUntilChanged()
//            .drive(onNext: { [weak self]    inset in
//                self?.rootView.frame.origin.y = -inset
//            }).addDisposableTo(history.disposeBag)
//        
//        let pages = ProductsDetailsTabBarController(viewControllers: [requisites, history, managment], selectedIndex: 0)
//        let viewFame = self.rootView.contentContainerView!
//        self.addChildViewControoler(pages, toContainerView: viewFame)
//    }
}
