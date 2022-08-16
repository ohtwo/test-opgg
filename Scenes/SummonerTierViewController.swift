//
//  SummonerTierViewController.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

class SummonerTierViewController: UICollectionViewController {
  
  var leagues: [Summoner.League] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

extension SummonerTierViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return leagues.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(for: indexPath) as SummonerTierCell
    
    let league = leagues[indexPath.item]
    cell.configure(with: league)

    return cell
  }
}
