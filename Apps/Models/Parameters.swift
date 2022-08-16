//
//  Parameters.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation

struct Parameters: Encodable {
  let parameters: Encodable

  init(encodable parameters: Encodable) {
    self.parameters = parameters
  }

  func encode(to encoder: Encoder) throws {
    return try parameters.encode(to: encoder)
  }
}
