//
//  PageTabBar.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/18/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import Material

class StatisticPageTabBarController: PageTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func prepare() {
        super.prepare()
        
//        delegate = self
        self.pageTabBarAlignment = .top
        preparePageTabBar()
    }
    
    fileprivate func preparePageTabBar() {
        let tabBar = self.pageTabBar
        
        tabBar.lineColor = Color.orange.base
        tabBar.lineAlignment = .bottom
        tabBar.lineHeight = 4.0
        
        tabBar.dividerColor = Color.blue.base
        tabBar.isDividerHidden = false
        tabBar.backgroundColor = Color.teal.base
    }
}

//extension StatisticPageTabBarController: PageTabBarControllerDelegate {
//    func pageTabBarController(pageTabBarController: PageTabBarController, didTransitionTo viewController: UIViewController) {
//    }
//}
