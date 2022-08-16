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
  private let bag = DisposeBag()
  
  var headerView: SummonerHeaderView {
    return tableView.tableHeaderView as! SummonerHeaderView
  }
  
  var tierViewController: SummonerTierViewController {
    return children.first as! SummonerTierViewController
  }
  
  private let viewModel = SummonerVM(name: "genetory")

  override func viewDidLoad() {
    super.viewDidLoad()

    bindUI()
  }
}

extension SummonerViewController {
  func bindUI() {
    viewModel.summoner.asDriver()
      .filterNil()
      .drive(onNext: { [weak self] in self?.headerView.configure(with: $0) })
      .disposed(by: bag)
    
    viewModel.summoner.asDriver()
      .filterNil()
      .map({ $0.leagues })
      .drive(onNext: { [weak self] in self?.tierViewController.leagues = $0 })
      .disposed(by: bag)

    viewModel.matches.asDriver()
      .filterNil()
      .drive(onNext: { [weak self] in self?.headerView.configure(with: $0) })
      .disposed(by: bag)
    
    viewModel.games.asDriver()
      .drive(onNext: { [weak self] _ in self?.tableView.reloadData() })
      .disposed(by: bag)
  }
}

extension SummonerViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.games.value.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as SummonerGameCell
    
    let game = viewModel.games.value[indexPath.row]
    cell.configure(with: game)
    
    return cell
  }
}
