//
//  SummonerHeaderView.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

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
