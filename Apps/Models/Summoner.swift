//
//  Summoner.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

struct SummonerInfo: Decodable {
  let summoner: Summoner
}

struct Summoner: Decodable {
  let name: String
  let level: Int
  let profileImageUrl: String
  
  let leagues: [League]
  let previousTiers: [TierRank]
}
