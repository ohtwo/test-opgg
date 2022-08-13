//
//  Summoner+League.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

extension Summoner {
  struct League: Decodable {
    let wins: Int
    let losses: Int
  }
}

extension Summoner.League {
  struct TierRank: Decodable {
    let name: String
    let imageUrl: String
  }
}
