//
//  Matches+Summary.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import Foundation

extension Matches {
  struct Summary: Decodable {
    let wins: Int
    let losses: Int
    let kills: Double
    let deaths: Double
    let assists: Double
  }
}

extension Matches.Summary {
  init() {
    wins = 0
    losses = 0
    kills = 0
    deaths = 0
    assists = 0
  }
}

extension Matches.Summary {
  var kdaString: String {
    let kda = (kills + assists) / deaths
    return String(format: "%.2f:1", kda)
  }
  
  var winRateString: String {
    let rate = Double(wins) / Double(wins + losses) * 100.0
    return String(format: "%.0f%%", rate)
  }
}
