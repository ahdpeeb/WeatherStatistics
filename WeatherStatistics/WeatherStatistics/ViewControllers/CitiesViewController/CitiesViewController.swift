//
//  cities cities CitiesViewController.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/13/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class CitiesViewController: UIViewController {
    fileprivate let disposeBag = DisposeBag()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var tableView: UITableView!
    
    fileprivate var serchTextObservable = Variable("")
    fileprivate var viewModel: CitiesViewModel!
    
    // MARK: ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
        self.setUpViewModel()
        self.subscribeTableView()
    }
    
    // MARK: Private func
    
    private func initialConfig() {
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true
        
        let tableView = self.tableView!
        tableView.registerCell(withClass: CityCell.self)
        tableView.tableHeaderView = searchController.searchBar
        tableView.rowAutoHeight(estimatedRowHeight: 40.0)
        tableView.rx.setDelegate(self).addDisposableTo(self.disposeBag)
    }
    
    private func setUpViewModel() {
        self.viewModel = CitiesViewModel(seachText: serchTextObservable)
    }
    
    private func subscribeTableView() {
        self.viewModel.cities.asDriver()
        .drive(self.tableView.rx.items) { (tableView: UITableView, index: Int, element: CitySourceData) in
            let cell = tableView.dequeueCell(cls:  CityCell.self, indexPath: [0, index])
            cell.nameLabel.text = element.name
            
            return cell
                
        }.addDisposableTo(disposeBag)
    }
}

extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.text.map({ self.serchTextObservable.value = $0 })
    }
}

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sourceModel = self.viewModel.cities.value[indexPath.row]
        let controller = UIStoryboard.controllerFromMainStorybourd(cls: WeathrStatisticViewController.self)
        controller.sourceData = sourceModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
  
