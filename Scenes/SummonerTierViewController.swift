//
//  SummonerTierViewController.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

private let reuseIdentifier = "SummonerTierCell"

class SummonerTierViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

// MARK: UICollectionViewDataSource

extension SummonerTierViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

    return cell
  }
}
