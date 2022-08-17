//
//  Foundation+Divide.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/17.
//

import Foundation

func divide(_ numer: Int, _ denom: Int) -> ldiv_t {
  return ldiv_t(quot: numer/denom, rem: numer%denom)
}
