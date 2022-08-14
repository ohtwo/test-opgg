//
//  SummonerViewController.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

class SummonerViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

// MARK: - Table view data source

extension SummonerViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SummonerGameCell")
    return cell ?? UITableViewCell()
  }
}
