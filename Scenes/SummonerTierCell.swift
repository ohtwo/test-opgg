//
//  SummonerTierCell.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit
import Kingfisher

class SummonerTierCell: UICollectionViewCell, ReusableView {
    
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var tierLabel: UILabel!
  @IBOutlet weak var pointLabel: UILabel!
  @IBOutlet weak var winLoseLabel: UILabel!
}

extension SummonerTierCell {
  override func prepareForReuse() {
    super.prepareForReuse()
    
    imageView?.kf.cancelDownloadTask()
    imageView?.kf.setImage(with: URL(string: ""))
    imageView?.image = nil
  }
  
  func configure(with league: Summoner.League) {
    let url = URL(string: league.tierRank.imageUrl)
    
    imageView.kf.setImage(with: url) { [weak self] result in
      guard let self = self else { return }
      guard case .success = result else { return }
      self.setNeedsLayout()
      self.layoutIfNeeded()
    }
    
    nameLabel.text = league.tierRank.name
    tierLabel.text = league.tierRank.tier
    pointLabel.text = "\(league.tierRank.lp) LP"
    winLoseLabel.text = "\(league.wins)승 \(league.losses)패 (\(league.winRateString))"
  }
}
