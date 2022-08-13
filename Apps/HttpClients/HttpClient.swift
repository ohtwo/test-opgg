//
//  HttpClient.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/13.
//

import Foundation
import Alamofire

struct HttpClient {
  private static let session = Session()

  static func request(_ route: HttpRoutable) -> DataRequest {
    let request =  session.request(route)
      .validate(statusCode: 200..<300)

    return request
  }
}

