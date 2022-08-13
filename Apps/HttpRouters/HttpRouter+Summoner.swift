//
//  HttpRouter+Summoner.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation
import Alamofire

extension HttpRouter {
  enum Summoner {
    case details(name: String)
    case matches(name: String)
  }
}

extension HttpRouter.Summoner: HttpRoutable {
  private var endpoint: String { return "summoner" }
  
  var path: String {
    switch self {
    case let .details(name):  return "/\(endpoint)/\(name)"
    case let .matches(name):  return "/\(endpoint)/\(name)/matches"
    }
  }
}
