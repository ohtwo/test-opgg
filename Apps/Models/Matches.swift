//
//  Matches.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

struct Matches: Decodable {
  let games: [Game]
  let champions: [Champion]
  let positions: [Position]
  let summary: Summary
}
