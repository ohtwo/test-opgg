//
//  SummonerHeaderView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit
import Kingfisher

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
  func configure(with summoner: Summoner) {
    let url = URL(string: summoner.profileImageUrl)
    
    profileImageView.kf.setImage(with: url) { [weak self] result in
      guard let self = self else { return }
      guard case .success = result else { return }
      self.setNeedsLayout()
      self.layoutIfNeeded()
    }
    
    nameLabel.text = summoner.name
    levelButton.titleLabel?.text = "\(summoner.level)"
  }
}
