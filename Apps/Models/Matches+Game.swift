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
    
    let createDate: UInt
    let gameType: String
    let gameLength: UInt
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
  var badgeHidden: Bool {
    return opScoreBadge.count == 0
  }
  
  var badgeColor: UIColor {
    return opScoreBadge == "MVP" ? .yellow : .purple
  }
}

extension Matches.Game.Stats {
  struct Ward: Decodable {
    let sightWardsBought: Int
    let visionWardsBought: Int
  }
}
