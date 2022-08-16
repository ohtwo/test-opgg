//
//  Stores.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/16.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import RxCocoa

class SummonerVM {
  private let bag = DisposeBag()
  
  let name: String
  
  var summoner = BehaviorRelay<Summoner?>(value: nil)
  var matches = BehaviorRelay<Matches?>(value: nil)
  
  var games = BehaviorRelay<[Matches.Game]>(value: [])
  var champions = BehaviorRelay<[Matches.Champion]>(value: [])
  var positions = BehaviorRelay<[Matches.Position]>(value: [])
  var summary = BehaviorRelay<Matches.Summary?>(value: nil)
  
  init(name: String) {
    self.name = name
        
    bind()
  }
}

extension SummonerVM {
  func bind() {
    HttpClient.fetchSummoner(of: name)
      .bind(to: summoner)
      .disposed(by: bag)
    
    let fetched = HttpClient.fetchMatches(of: name).share()
    
    fetched.bind(to: matches)
      .disposed(by: bag)
    
    fetched.map({ $0.games })
      .bind(to: games)
      .disposed(by: bag)
    
    fetched.map({ $0.champions })
      .bind(to: champions)
      .disposed(by: bag)
    
    fetched.map({ $0.positions })
      .bind(to: positions)
      .disposed(by: bag)
    
    fetched.map({ $0.summary })
      .bind(to: summary)
      .disposed(by: bag)
  }
}
