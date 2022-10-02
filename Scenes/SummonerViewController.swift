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
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    bindUI()
  }
}

extension SummonerViewController {
  func bindUI() {
    // Setup data source
    tableView.dataSource = nil
    tableView.delegate = nil
    collectionView.dataSource = nil
    
    // Bind data to UI
    viewModel.summoner.asDriver()
      .filterNil()
      .drive(onNext: configureHeaderView)
      .disposed(by: disposeBag)
    
    viewModel.matches.asDriver()
      .filterNil()
      .drive(onNext: configureHeaderView)
      .disposed(by: disposeBag)
    
    viewModel.leagues.asDriver()
      .drive(collectionView.rx.items(cellIdentifier: SummonerTierCell.reuseIdentifier, cellType: SummonerTierCell.self),
             curriedArgument: configureCell)
      .disposed(by: disposeBag)
    
    viewModel.games.asDriver()
      .drive(tableView.rx.items(cellIdentifier: SummonerGameCell.reuseIdentifier, cellType: SummonerGameCell.self),
        curriedArgument: configureCell)
      .disposed(by: disposeBag)
    
    tableView.rx.prefetchRows
      .compactMap(\.last?.row)
      .subscribe(onNext: prefetchRows)
      .disposed(by: disposeBag)
    
    headerView.refreshButton.rx.tap
      .subscribe(onNext: viewModel.refresh)
      .disposed(by: disposeBag)
    
    func configureHeaderView(with summoner: Summoner) {
      headerView.configure(with: summoner)
    }
    
    func configureHeaderView(with matches: Matches) {
      headerView.configure(with: matches)
    }
    
    func configureCell(_: Int, league: Summoner.League, cell: SummonerTierCell) {
      cell.configure(with: league)
    }
    
    func configureCell(_: Int, game: Matches.Game, cell: SummonerGameCell) {
      cell.configure(with: game)
    }
    
    func prefetchRows(row: Int) {
      guard row == viewModel.games.value.count - 1 else { return }
      viewModel.fetch(viewModel.games.value.last?.createDate)
    }
  }
}
