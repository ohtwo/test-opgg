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
    let kills: Int
    let deaths: Int
    let assists: Int
  }
}
