//
//  Summoner+League.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

extension Summoner {
  struct League: Decodable {
    let hasResults: Bool
    let wins: Int
    let losses: Int
    let tierRank: TierRank
  }
}

extension Summoner.League {
  var winRate: Double {
    let rate = Double(wins) / Double(wins + losses) * 100.0
    return ceil(rate)
  }
}
