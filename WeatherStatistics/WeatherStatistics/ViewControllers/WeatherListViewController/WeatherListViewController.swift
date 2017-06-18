//
//  WeatherListViewController.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/17/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import Material

class WeatherListViewController: UIViewController, WeathrStatisticProtocol {
    var city: City? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.preparePageTabBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewConfig()
    }
    
    private func tableViewConfig() {
        tableView.rowAutoHeight(estimatedRowHeight: 100.0)
        tableView.registerCell(withClass: MonthCell.self)
        tableView.registerHeader(withClass: YearHeaderView.self)
    }
    
    fileprivate func setVisible(_ isVisible: Bool, forRowInSections section: Int) {
        guard let tableView = self.tableView, let model = self.city else { return }
        model.years[section].isContentVisible = isVisible
        let cellsCount =  self.tableView.numberOfRows(inSection: section)
        var paths = [IndexPath]()
        for row in 0 ..< cellsCount {
            paths.append([section, row])
        }
        
        tableView.update {
            tableView.reloadRows(at: paths, with: .none)
        }
        
        if isVisible {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                tableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: true)
            }
        }
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return city?.years.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city?.years[section].mounthStatistic.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cls: MonthCell.self, indexPath: indexPath)
        
        
        if let model = city?.years[indexPath.section].mounthStatistic[indexPath.row] {
            cell.fillWithMonthData(model)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueHeader(cls: YearHeaderView.self)
        let model = city?.years[section]
        
        header.titleLabel.text = (model?.year).map({ String($0) })
        header.menuButton.isSelected = model?.isContentVisible ?? false
        
        header.menuButtonBlock = { [weak self] button in
            let isSelected = button.isSelected
            self?.setVisible(!isSelected, forRowInSections: section)
            button.isSelected = !isSelected
        }

        return header
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isVisible = self.city?.years[indexPath.section].isContentVisible ?? false
        return isVisible ? 150 : 0
    }
}

extension WeatherListViewController {
    fileprivate func preparePageTabBarItem() {
        pageTabBarItem.titleColor = Color.blueGrey.darken4
        pageTabBarItem.title = "List"
    }
}
