//
//  Matches+Champion.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation
import UIKit

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

extension Matches.Champion {
  var winRate: Double {
    return Double(wins) / Double(games) * 100.0
  }
  
  var winRateString: String {
    return String(format: "%.0f%%", winRate)
  }
  
  var winRateColor: UIColor {
    return winRate == Double(100) ? .darkishPink : .darkGrey
  }
  
  var fixedImageUrl: URL? {
    // Server-side imageUrl error
    // e.g. [name: "판테온", imageUrl: "//opgg-static.akamaized.net/..."]
    return imageUrl.hasPrefix("https:") ? URL(string: imageUrl) : URL(string: "https:\(imageUrl)")
  }
}
