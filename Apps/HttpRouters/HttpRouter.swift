//
//  HttpRouter.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation
import Alamofire

enum HttpRouter {
  static let host = "https://codingtest.op.gg/api"
}

extension HttpRoutable {
  var host: String {
    return HttpRouter.host
  }

  var method: HTTPMethod {
    return .get
  }

  var headers: HTTPHeaders? {
    return HTTPHeaders.default
  }

  var parameters: Parameters? {
    return nil
  }

  var encoder: ParameterEncoder {
    return URLEncodedFormParameterEncoder.default
  }
}
