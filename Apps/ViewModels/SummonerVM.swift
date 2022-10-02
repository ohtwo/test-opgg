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
  private let disposeBag = DisposeBag()
  
  var summoner = BehaviorRelay<Summoner?>(value: nil)
  var leagues = BehaviorRelay<[Summoner.League]>(value: [])
  
  var matches = BehaviorRelay<Matches?>(value: nil)
  var games = BehaviorRelay<[Matches.Game]>(value: [])
  var fetchDate = BehaviorRelay<Int?>(value: nil)
  
  init(name: String) {
    super.init()
    
    bind(name)
  }
}

extension SummonerVM {
  private func bind(_ name: String) {
    // Fetch summoner and bind
    let sharedSummoner = fetchDate
      .filter({ $0 == nil })
      .map({ _ in })
      .flatMapLatest({
        HttpClient.fetchSummoner(of: name)
      })
      .share()
    
    sharedSummoner.bind(to: summoner)
      .disposed(by: disposeBag)
    
    sharedSummoner.map({ $0.leagues })
      .bind(to: leagues)
      .disposed(by: disposeBag)
    
    // Fetch matches and bind
    let sharedMatches = fetchDate
      .flatMapLatest({
        HttpClient.fetchMatches(of: name, last: $0)
      })
      .share()
    
    sharedMatches.bind(to: matches)
      .disposed(by: disposeBag)
    
    sharedMatches.map(\.games)
      .map({ [weak self] games -> [Matches.Game] in
        guard let self = self else { return [] }
        return self.games.value + games
      })
      .bind(to: games)
      .disposed(by: disposeBag)
  }
  
  func fetch(_ date: Int? = nil) {
    fetchDate.accept(date)
  }
  
  func refresh() {
    games.accept([])
    fetchDate.accept(nil)
  }
}
