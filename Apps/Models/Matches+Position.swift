//
//  Matches+Position.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import Foundation

extension Matches {
  struct Position: Decodable {
    let games: Int
    let wins: Int
    let losses: Int
    let position: String
    let positionName: String
  }
}
