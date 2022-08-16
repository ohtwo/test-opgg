//
//  SummonerVM+UITableView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/16.
//

import UIKit

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
