//
//  Summoner+TierRank.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import Foundation

extension Summoner {
  struct TierRank: Decodable {
    let name: String
    let tier: String
    let string: String
    let imageUrl: String
    let lp: Int
    let tierRankPoint: Int
    
    let season: Int?
  }
}
