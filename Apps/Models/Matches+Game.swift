//
//  Summoner+Game.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

extension Matches {
  struct Game: Decodable {
    let champion: Champion
    let spells: [Game.Image]
    let items: [Game.Image]
    
    let createDate: Double
    let gameType: String
    let gameLength: Double
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
    
    let opScoreBadge: String
    let contributionForKillRate: String
  }
}

extension Matches.Game.Stats {
  struct Ward: Decodable {
    let sightWardsBought: Int
    let visionWardsBought: Int
  }
}
