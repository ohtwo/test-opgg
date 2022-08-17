//
//  UIColor+Named.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/17.
//

import UIKit

extension UIColor {
  enum Named: String {
    case backgroud
    case charcoalGrey
    case coolGrey
    case darkGrey
    case darkGrey90
    case darkishPink
    case greenBlue
    case gunmetal
    case orangeYellow
    case paleGrey
    case paleGreyTwo
    case periwinkle
    case softBlue
    case steelGrey
    case steelGrey10
    case white
    case white40
  }
  
  convenience init(named name: Named) {
    self.init(named: name.rawValue)!
  }
}

extension UIColor {
  static let backgroud = UIColor(named: .backgroud)
  static let charcoalGrey = UIColor(named: .charcoalGrey)
  static let coolGrey = UIColor(named: .coolGrey)
  static let darkGrey = UIColor(named: .darkGrey)
  static let darkGrey90 = UIColor(named: .darkGrey90)
  static let darkishPink = UIColor(named: .darkishPink)
  static let greenBlue = UIColor(named: .greenBlue)
  static let gunmetal = UIColor(named: .gunmetal)
  static let orangeYellow = UIColor(named: .orangeYellow)
  static let paleGrey = UIColor(named: .paleGrey)
  static let paleGreyTwo = UIColor(named: .paleGreyTwo)
  static let periwinkle = UIColor(named: .periwinkle)
  static let softBlue = UIColor(named: .softBlue)
  static let steelGrey = UIColor(named: .steelGrey)
  static let steelGrey10 = UIColor(named: .steelGrey10)
  static let white = UIColor(named: .white)
  static let white40 = UIColor(named: .white40)
}
