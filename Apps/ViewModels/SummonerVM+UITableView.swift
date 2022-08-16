//
//  SummonerVM+UITableView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/16.
//

import UIKit
import RxSwift

extension SummonerVM: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return games.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as SummonerGameCell
        
    let game = games.value[indexPath.row]
    cell.configure(with: game)
    
    return cell
  }
}

extension SummonerVM: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    guard let index = indexPaths.sorted(by: { $0.row < $1.row }).last?.row else { return }
    guard index == games.value.count-10 else { return }
    
    fetchGames(tableView)
  }
    
  func fetchGames(_ tableView: UITableView) {
    guard !isFetching else { return }
    
    isFetching = true
        
    let current = self.games.value
    
    let fetched = HttpClient.fetchMatches(of: name, last: current.last?.createDate)
      .map({ current + $0.games })
      .share()
    
    fetched.bind(to: games)
      .disposed(by: bag)
    
    fetched.subscribe(onDisposed: { [weak self] in
      self?.isFetching = false
    })
    .disposed(by: bag)
  }
}
