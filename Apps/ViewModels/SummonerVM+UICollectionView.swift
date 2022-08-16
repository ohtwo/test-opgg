//
//  SummonerVM+UICollectionView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/16.
//

import UIKit

extension SummonerVM: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return leagues.value.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(for: indexPath) as SummonerTierCell
    
    let league = leagues.value[indexPath.item]
    cell.configure(with: league)

    return cell
  }
}
