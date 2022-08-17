//
//  SummonerHeaderView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit
import Kingfisher
import CoreAudio

class SummonerHeaderView: UIView {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var levelButton: UIButton!
  @IBOutlet weak var refreshButton: UIButton!
  
  @IBOutlet weak var winLoseLabel: UILabel!
  @IBOutlet weak var killDeathLabel: UILabel!
  @IBOutlet weak var kdaLabel: UILabel!
  
  @IBOutlet var mostImageViews: [UIImageView]!
  @IBOutlet var mostLabels: [UILabel]!
  
  @IBOutlet weak var positionImageView: UIImageView!
  @IBOutlet weak var positionLabel: UILabel!
}

extension SummonerHeaderView {
  override func awakeFromNib() {
    super.awakeFromNib()
    
    mostImageViews.forEach({ $0.image = nil })
    mostLabels.forEach({ $0.text = nil })
  }
}

extension SummonerHeaderView {
  func configure(with summoner: Summoner) {
    let url = URL(string: summoner.profileImageUrl)
    
    profileImageView.kf.setImage(with: url)
    nameLabel.text = summoner.name
    levelButton.setTitle(String(summoner.level), for: .normal)
  }
  
  func configure(with matches: Matches) {
    // Summary
    let summary = matches.summary
    winLoseLabel.text = "\(summary.wins)승 \(summary.losses)패"
    killDeathLabel.attributedText = summary.attributedKillDeathText
    kdaLabel.attributedText = summary.attributedKDAText
    
    // Most
    let champions = matches.champions.sorted(by: { $0.winRate > $1.winRate })
    
    for (index, champion) in champions.enumerated() {
      guard index < mostImageViews.count else { continue }
      guard index < mostLabels.count else { continue }
      
      mostImageViews[index].kf.setImage(with: champion.fixedImageUrl)
      mostLabels[index].text = champion.winRateString
      mostLabels[index].textColor = champion.winRateColor
    }
    
    // Postion
    guard let position = matches.positions.first else { return }
    positionImageView.image = position.image
    positionLabel.text = position.rateString
  }
}
