//
//  Champion.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

extension Matches {
  struct Champion: Decodable {
    let id: Int
    let key: String
    let name: String
    let imageUrl: String
    
    let games: Int
    let kills: Int
    let deaths: Int
    let assists: Int
    let wins: Int
    let losses: Int
  }
}
