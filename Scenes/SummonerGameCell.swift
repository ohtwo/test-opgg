//
//  SummonerGameCell.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

class SummonerGameCell: UITableViewCell, ReusableView {

  @IBOutlet weak var resultView: UIView!
  @IBOutlet weak var winLoseLabel: UILabel!
  @IBOutlet weak var gameLengthLabel: UILabel!
  
  @IBOutlet weak var championImageView: UIImageView!
  @IBOutlet weak var scoreBadge: UIButton!
  @IBOutlet var spellImageViews: [UIImageView]!
  @IBOutlet var itemImageViews: [UIImageView]!
  
  @IBOutlet weak var killDeathLabel: UILabel!
  @IBOutlet weak var contributionLabel: UILabel!
  
  @IBOutlet weak var gameTypeLabel: UILabel!
  @IBOutlet weak var createDateLabel: UILabel!
  @IBOutlet weak var multiKillLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}

extension SummonerGameCell {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
  }
}
