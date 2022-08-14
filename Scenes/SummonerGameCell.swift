//
//  SummonerGameCell.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/14.
//

import UIKit

class SummonerGameCell: UITableViewCell {

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
