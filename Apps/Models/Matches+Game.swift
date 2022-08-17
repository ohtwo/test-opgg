//
//  Summoner+Game.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation
import UIKit

extension Matches {
  struct Game: Decodable {
    let champion: Champion
    let spells: [Game.Image]
    let items: [Game.Image]
    
    let createDate: Int
    let gameType: String
    let gameLength: Int
    let isWin: Bool
    
    let stats: Stats
  }
}

extension Matches.Game {
  struct Champion: Decodable {
    let level: Int
    let imageUrl: String
  }
}

extension Matches.Game {
  struct Image: Decodable {
    let imageUrl: String
  }
}

extension Matches.Game.Image {
  var isLastItem: Bool {
    return imageUrl.lowercased().hasSuffix("3340.png")
  }
}

extension Matches.Game {
  struct Stats: Decodable {
    let general: General
    let ward: Ward
  }
}

extension Matches.Game.Stats {
  struct General: Decodable {
    let kill: Int
    let death: Int
    let assist: Int
    
    let contributionForKillRate: String
    let largestMultiKillString: String
    let opScoreBadge: String
  }
}

extension Matches.Game.Stats.General {
  var isBadgeHidden: Bool {
    return opScoreBadge.count == 0
  }
  
  var badgeColor: UIColor {
    return opScoreBadge == "MVP" ? .orangeYellow : .periwinkle
  }
  
  var isMultiKillHidden: Bool {
    return largestMultiKillString.count == 0
  }
  
  var attributedKillDeathText: NSAttributedString {
    typealias Attributes = [NSAttributedString.Key : Any]
    
    let attrGray: Attributes = [
      .font: UIFont.systemFont(ofSize: 16.0, weight: .bold),
      .foregroundColor: UIColor.charcoalGrey
    ]
    
    let attrPink: Attributes = [
      .font: UIFont.systemFont(ofSize: 16.0, weight: .bold),
      .foregroundColor: UIColor.darkishPink
    ]
    
    let attrSlash: Attributes = [
      .font: UIFont.systemFont(ofSize: 16.0, weight: .regular),
      .foregroundColor: UIColor.charcoalGrey
    ]
    
    let kill = NSMutableAttributedString(string: "\(kill)", attributes: attrGray)
    let death = NSMutableAttributedString(string: "\(death)", attributes: attrPink)
    let assist = NSMutableAttributedString(string: "\(assist)", attributes: attrGray)
    let slash = NSMutableAttributedString(string: " / ", attributes: attrSlash)
    
    let attributed = NSMutableAttributedString()
    attributed.append(kill)
    attributed.append(slash)
    attributed.append(death)
    attributed.append(slash)
    attributed.append(assist)
    
    return attributed
  }
}

extension Matches.Game.Stats {
  struct Ward: Decodable {
    let sightWardsBought: Int
    let visionWardsBought: Int
  }
}
