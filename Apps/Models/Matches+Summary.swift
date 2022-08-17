//
//  Matches+Summary.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import UIKit

extension Matches {
  struct Summary: Decodable {
    let wins: Int
    let losses: Int
    let kills: Double
    let deaths: Double
    let assists: Double
  }
}

extension Matches.Summary {
  init() {
    wins = 0
    losses = 0
    kills = 0
    deaths = 0
    assists = 0
  }
}

extension Matches.Summary {
  var kdaString: String {
    let kda = (kills + assists) / deaths
    return String(format: "%.2f:1", kda)
  }
  
  var winRateString: String {
    let rate = Double(wins) / Double(wins + losses) * 100.0
    return String(format: "%.0f%%", rate)
  }
  
  var attributedKillDeathText: NSAttributedString {
    typealias Attributes = [NSAttributedString.Key : Any]
    
    let attrGray: Attributes = [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      .foregroundColor: UIColor.charcoalGrey
    ]
    
    let attrPink: Attributes = [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      .foregroundColor: UIColor.darkishPink
    ]
    
    let attrSlash: Attributes = [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
      .foregroundColor: UIColor.charcoalGrey
    ]
    
    let kill = NSMutableAttributedString(string: "\(kills)", attributes: attrGray)
    let death = NSMutableAttributedString(string: "\(deaths)", attributes: attrPink)
    let assist = NSMutableAttributedString(string: "\(assists)", attributes: attrGray)
    let slash = NSMutableAttributedString(string: " / ", attributes: attrSlash)
    
    let attributed = NSMutableAttributedString()
    attributed.append(kill)
    attributed.append(slash)
    attributed.append(death)
    attributed.append(slash)
    attributed.append(assist)
    
    return attributed
  }
  
  var attributedKDAText: NSAttributedString {
    let kda = NSMutableAttributedString(
      string: kdaString,
      attributes: [
        .font: UIFont.systemFont(ofSize: 10.0, weight: .regular),
        .foregroundColor: UIColor.greenBlue
       ])
    
    let rate = NSMutableAttributedString(
      string: " (\(winRateString))",
      attributes: [
        .font: UIFont.systemFont(ofSize: 10.0, weight: .regular),
        .foregroundColor: UIColor.darkishPink
       ])
    
    let attributed = NSMutableAttributedString()
    attributed.append(kda)
    attributed.append(rate)
    
    return attributed
  }
}
