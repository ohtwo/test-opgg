//
//  HttpClient+Summoner.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/15.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

extension HttpClient {
  static func fetchSummoner(of name: String) -> Observable<Summoner> {
    let route = HttpRouter.Summoner.details(name: name)
    
    let details = Observable.just(route)
      .flatMap({ route -> Observable<(HTTPURLResponse, SummonerInfo)> in
        HttpClient.request(route).rx.responseDecodable()
      })
      .map({ $0.1.summoner })
      
    return details
  }
  
  static func fetchMatches(of name: String, last: Int? = nil) -> Observable<Matches> {
    let route = HttpRouter.Summoner.matches(name: name, last: last)
    
    let matches = Observable.just(route)
      .flatMap({ route -> Observable<(HTTPURLResponse, Matches)> in
        HttpClient.request(route).rx.responseDecodable()
      })
      .map({ $0.1 })
      
    return matches
  }
}
