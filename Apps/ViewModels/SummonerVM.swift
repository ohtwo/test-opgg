//
//  SummonerVM.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/16.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import RxCocoa

class SummonerVM: NSObject {
  private let bag = DisposeBag()
  
  let name: String
  
  var summoner = BehaviorRelay<Summoner?>(value: nil)
  var leagues = BehaviorRelay<[Summoner.League]>(value: [])
  
  var matches = BehaviorRelay<Matches?>(value: nil)
  var games = BehaviorRelay<[Matches.Game]>(value: [])
  
  init(name: String) {
    self.name = name
    
    super.init()
    
    bind()
  }
}

extension SummonerVM {
  func bind() {
    // Fetch summoner and bind
    let sharedSummoner = HttpClient.fetchSummoner(of: name).share()
    
    sharedSummoner.bind(to: summoner)
      .disposed(by: bag)
    
    sharedSummoner.map({ $0.leagues })
      .bind(to: leagues)
      .disposed(by: bag)
    
    // Fetch matches and bind
    let sharedMatches = HttpClient.fetchMatches(of: name).share()
    
    sharedMatches.bind(to: matches)
      .disposed(by: bag)
    
    sharedMatches.map({ $0.games })
      .bind(to: games)
      .disposed(by: bag)
  }
}
