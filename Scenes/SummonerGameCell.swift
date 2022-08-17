//
//  SummonerGameCell.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit
import Kingfisher

class SummonerGameCell: UITableViewCell, ReusableView {

  @IBOutlet weak var resultView: UIView!
  @IBOutlet weak var winLoseLabel: UILabel!
  @IBOutlet weak var gameLengthLabel: UILabel!
  
  @IBOutlet weak var championImageView: UIImageView!
  @IBOutlet weak var badgeLabel: UILabel!
  @IBOutlet var spellImageViews: [UIImageView]!
  @IBOutlet var itemImageViews: [UIImageView]!
  
  @IBOutlet weak var killDeathLabel: UILabel!
  @IBOutlet weak var contributionLabel: UILabel!
  
  @IBOutlet weak var gameTypeLabel: UILabel!
  @IBOutlet weak var createDateLabel: UILabel!
  @IBOutlet weak var multiKillButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}

extension SummonerGameCell {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    championImageView?.kf.cancelDownloadTask()
    championImageView?.kf.setImage(with: URL(string: ""))
    championImageView?.image = nil
    
    badgeLabel.isHidden = true
    badgeLabel.text = nil
    
    spellImageViews.forEach { view in
      view.kf.cancelDownloadTask()
      view.kf.setImage(with: URL(string: ""))
      view.image = nil
    }
    
    itemImageViews.forEach { view in
      view.kf.cancelDownloadTask()
      view.kf.setImage(with: URL(string: ""))
      view.image = nil
    }
    
    killDeathLabel.text = nil
    contributionLabel.text = nil
    
    gameTypeLabel.text = nil
    createDateLabel.text = nil
    multiKillButton.setTitle(nil, for: .normal)
    multiKillButton.isHidden = true
  }
}

extension SummonerGameCell {
  func configure(with game: Matches.Game) {
    // Game result
    resultView.backgroundColor = game.isWin ? .softBlue : .darkishPink
    winLoseLabel.text = game.isWin ? "승" : "패"
    gameLengthLabel.text = game.gameLengthString
    
    // Champion
    let url = URL(string: game.champion.imageUrl)
    championImageView.kf.setImage(with: url) { [weak self] result in
      guard let self = self else { return }
      guard case .success = result else { return }
      self.setNeedsLayout()
      self.layoutIfNeeded()
    }
    
    // Score badge
    badgeLabel.isHidden = game.stats.general.isBadgeHidden
    badgeLabel.backgroundColor = game.stats.general.badgeColor
    badgeLabel.text = game.stats.general.opScoreBadge
    
    // Spells
    for (index, spell) in game.spells.enumerated() {
      guard index < spellImageViews.count else { continue }
      
      let view = spellImageViews[index]
      let url = URL(string: spell.imageUrl)
      
      view.kf.setImage(with: url) { [weak self] result in
        guard let self = self else { return }
        guard case .success = result else { return }
        self.setNeedsLayout()
        self.layoutIfNeeded()
      }
    }
        
    // Items
    for (index, item) in game.items.enumerated() {
      guard index < itemImageViews.count else { continue }
      
      guard let view = item.isLastItem ? itemImageViews.last : itemImageViews[index] else { continue }
      let url = URL(string: item.imageUrl)
      
      view.kf.setImage(with: url) { [weak self] result in
        guard let self = self else { return }
        guard case .success = result else { return }
        self.setNeedsLayout()
        self.layoutIfNeeded()
      }
    }
    
    // KDA
    killDeathLabel.attributedText = game.stats.general.attributedKillDeathText
    contributionLabel.text = "킬관여 \(game.stats.general.contributionForKillRate)"
    
    gameTypeLabel.text = game.gameType
    createDateLabel.text = game.createDateString
    
    multiKillButton.setTitle(game.stats.general.largestMultiKillString, for: .normal)
    multiKillButton.isHidden = game.stats.general.isMultiKillHidden
  }
}
