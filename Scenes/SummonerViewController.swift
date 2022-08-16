//
//  SummonerViewController.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import RxOptional

class SummonerViewController: UITableViewController {
  
  var headerView: SummonerHeaderView {
    return tableView.tableHeaderView as! SummonerHeaderView
  }
    
  var collectionView: UICollectionView {
    guard let vc = children.first as? SummonerTierViewController else { fatalError("Check view hierarchy") }
    return vc.collectionView
  }
  
  private let viewModel = SummonerVM(name: "genetory")
  private let bag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    bindUI()
  }
}

extension SummonerViewController {
  func bindUI() {
    // Setup data source
    tableView.dataSource = viewModel
    tableView.prefetchDataSource = viewModel
    collectionView.dataSource = viewModel
    
    // Bind data to UI
    viewModel.summoner.asDriver()
      .filterNil()
      .drive(onNext: { [weak self] in self?.headerView.configure(with: $0) })
      .disposed(by: bag)
    
    viewModel.matches.asDriver()
      .filterNil()
      .drive(onNext: { [weak self] in self?.headerView.configure(with: $0) })
      .disposed(by: bag)
    
    viewModel.leagues.asDriver()
      .drive(onNext: { [weak self] _ in self?.collectionView.reloadData() })
      .disposed(by: bag)
    
    viewModel.games.asDriver()
      .drive(onNext: { [weak self] _ in self?.tableView.reloadData() })
      .disposed(by: bag)
  }
}
