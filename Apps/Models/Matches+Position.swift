//
//  Matches+Position.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import Foundation
import UIKit

extension Matches {
  struct Position: Decodable {
    let games: Int
    let wins: Int
    let losses: Int
    let position: String
    let positionName: String
  }
}

extension Matches.Position {
  var image: UIImage? {
    return UIImage(named: "icon_lol_\(position.lowercased())") ?? UIImage(named: "icon_lol_all")
  }
  
  var rateString: String {
    let rate = Double(wins) / Double(games) * 100.0
    return String(format: "%.0f%%", rate)
  }
}
