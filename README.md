# 요구사항

## 주제

### 주어진 테스트 API를 사용하여 소환사 메인 페이지를 볼 수 있는 어플리케이션 제작

- 진행 프로그램: 제플린

- 필수 사항
    - 실행 가능하고, 크래시가 없는 프로젝트
    - **iOS** : Swift 5 사용, iOS 10.0 이상 지원
- 우대사항
    - **iOS:**
        - Autolayout 을 활용한 UI 구성
        - 오픈소스 사용
        - Custom View 활용
- 참고 사항
    
    본 과제는 동작하는 앱의 단순 구현이 목적이 아니라 평소 개발적인 능력과 습관을 파악하기 위함입니다.  본인이 생각하는 가장 깔끔하고 효율적인 구조의 코드를 작성해주세요.
    데이터가 없을 때, 애니메이션 등 명시되지 않은 부분은 자유롭게 결정하여 구현해주세요.
    ***사전 과제 기간동안 100% 완성이 필수 사항이 아닙니다***
    

## TEST API 정보

### 소환사정보

https://codingtest.op.gg/api/summoner/genetory

### 사용필드

summoner → name : 소환사이름
summoner → level : 소환사레벨
summoner → profileImageUrl : 소환사프로필이미지
summoner → leagues → wins : 이긴 게임수
summoner → leagues → losses : 진게임수
summoner → leagues → tierRank → name : 게임타입
summoner → leagues → tierRank → imageUrl : 티어이미지

### 게임정보

https://codingtest.op.gg/api/summoner/genetory/matches?lastMatch={createDate}

### 사용필드

games → champion : 챔피언정보
games → spells : 챔피언스펠
games → items : 챔피언아이템
games → createDate : 게임시작 시간
games → gameType : 게임타입
games → gameLength : 전체게임시간
games → isWin : 승리/ 패배
games → stats->general → kills : 킬수
games → stats->general → deaths : 데스수
games → stats->general → assists : 어시스트수
games → stats->general → opScoreBadge : MVP,ACE 뱃지
games → stats->general → contributionForKillRate : 킬 관여율
games → champions : 사용한챔피언정보

Load more 구현시마지막게임createDate 로lastMatch 파라미터에 담아개발해주시면됩니다.

## 과제 안내

![그림1](https://user-images.githubusercontent.com/888140/185182055-a28ea0e9-cf7a-4ae0-9915-7ba6ec212553.jpeg)

1. 테스트API 를사용하여 데이터를 가져옵니다.
2. 전적갱신을터치하면다시데이터를 가져옵니다.
3. 티어가보여지는 화면은가로스크롤됩니다.
4. 5.9 / 5.8 / 14.1 : kills / assits / deaths
5. KDA 공식: (kills + assists) / deaths
6. 모스트승률은챔피언승률상위2개의챔피언으로구성됩니다.
7. Load more 기능을구현해주세요.
8. 무승부는 없습니다.

# 구현사항

## 적용기술

* UIKit
* Storyboard
* AutoLayout
* MVVM
* Alamofire
* RxSwift
* RxAlmofire
* RxOptional
* Decodable 모델
* HttpClient 모듈
* HttpRouter 모듈
* SwiftDate
* Kingfisher

> Named Color 사용으로 iOS 10이 아닌 OPGG 앱과 동일한 iOS 13 적용

## 기타
* Named Color Assets 사용
* UI 코너 라운드, 원형 처리는 `@IBInspectable`로 스토리보드에서 처리
* Load more는 `UITableViewDataSourcePrefetching`로 처리

## 스크린샷

![Simulator Screen Shot - iPhone 13 Pro - 2022-08-18 at 00 47 57](https://user-images.githubusercontent.com/888140/185184628-d6f345ed-8499-48fc-b87c-715c47cf8125.png)