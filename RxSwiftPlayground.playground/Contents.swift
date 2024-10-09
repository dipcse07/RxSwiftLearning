import UIKit
import RxSwift


//MARK: - For Transforming Observables examble learning ( Pleaes uncommnet when run also uncomment the support code)

//var greeting = "Hello, playground"
//example(of: "Subscribe") {
//  let observable = Observable.of(episodeIV,episodeV,episodeVI)
//  observable.subscribe{
//    event in
//    print(event)
//  }
//}

//example(of: "map") {
//
//    let disposeBag = DisposeBag()
//
//    Observable.from([episodeI, episodeII, episodeIII, episodeIV, episodeV, episodeVI, episodeVII, episodeVIII, episodeIX])
//        .map { episode -> String in
//            var components = episode.components(separatedBy: " ")
//            let number = NSNumber(value: (try? components[1].romanNumeralIntValue()) ?? 0)
//            let numberString = String(describing: number)
//            components[1] = numberString
//            return components.joined(separator: " ")
//        }
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)
//}
//
//extension String {
//    func romanNumeralIntValue() -> Int? {
//        let romanValues = ["M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100, "XC": 90, "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1]
//        var total = 0
//        var index = startIndex
//
//        while index != endIndex {
//            let singleChar = String(self[index])
//            let nextIndex = self.index(after: index)
//            let doubleChar = nextIndex != endIndex ? String(self[index...nextIndex]) : nil
//
//            if let value = doubleChar.flatMap({ romanValues[$0] }) {
//                total += value
//                index = self.index(after: nextIndex)
//            } else if let value = romanValues[singleChar] {
//                total += value
//                index = nextIndex
//            } else {
//                return nil // Invalid Roman numeral
//            }
//        }
//
//        return total
//    }
//}
//
//
//example(of: "flatMap") {
//  
//  let disposeBag = DisposeBag()
//  
//  let ryan = Jedi(rank: BehaviorSubject(value: .youngling))
//  let charlotte = Jedi(rank: BehaviorSubject(value: .youngling))
//  
//  let student = PublishSubject<Jedi>()
//  
//  student
//    .flatMap {
//      $0.rank
//    }
//    .subscribe(onNext: {
//      print($0.rawValue)
//    })
//    .disposed(by: disposeBag)
//  
//  student.onNext(ryan)
//  
//  ryan.rank.onNext(.padawan)
//  
//  student.onNext(charlotte)
//  
//  ryan.rank.onNext(.jediKnight)
//  
//  charlotte.rank.onNext(.jediMaster)
//}
//
//example(of: "flatMapLatest") {
//  
//  let disposeBag = DisposeBag()
//  
//  let ryan = Jedi(rank: BehaviorSubject(value: .youngling))
//  let charlotte = Jedi(rank: BehaviorSubject(value: .youngling))
//  
//  let student = PublishSubject<Jedi>()
//  
//  student
//    .flatMapLatest {
//      $0.rank
//    }
//    .subscribe(onNext: {
//      print($0.rawValue)
//    })
//    .disposed(by: disposeBag)
//  
//  student.onNext(ryan)
//  
//  ryan.rank.onNext(.padawan)
//  
//  student.onNext(charlotte)
//  
//  ryan.rank.onNext(.jediKnight)
//  
//  charlotte.rank.onNext(.jediMaster)
//}
//
//public struct Jedi {
//  
//  public var rank: BehaviorSubject<JediRank>
//  
//  public init(rank: BehaviorSubject<JediRank>) {
//    self.rank = rank
//  }
//}
//
//public enum JediRank: String {
//  
//  case youngling = "Youngling"
//  case padawan = "Padawan"
//  case jediKnight = "Jedi Knight"
//  case jediMaster = "Jedi Master"
//  case jediGrandMaster = "Jedi Grand Master"
//}

//MARK: - Combining observables

//MARK: For Combining observables
public let episodeI = "The Phantom Menace"
public let episodeII = "Attack of the Clones"
public let theCloneWars = "The Clone Wars"
public let episodeIII = "Revenge of the Sith"
public let solo = "Solo"
public let rogueOne = "Rogue One"
public let episodeIV = "A New Hope"
public let episodeV = "The Empire Strikes Back"
public let episodeVI = "Return Of The Jedi"
public let episodeVII = "The Force Awakens"
public let episodeVIII = "The Last Jedi"
public let episodeIX = "Episode IX"

public let luke = "Luke Skywalker"
public let hanSolo = "Han Solo"
public let leia = "Princess Leia"
public let chewbacca = "Chewbacca"

public let lightsaber = "Lightsaber"
public let dl44 = "DL-44 Blaster"
public let defender = "Defender Sporting Blaster"
public let bowcaster = "Bowcaster"

let formatter = DateComponentsFormatter()

func stringFrom(_ minutes: Int) -> String {
  let interval = TimeInterval(minutes)
  return formatter.string(from: interval) ?? ""
}

 let runtimes = [
  episodeI: 136,
  episodeII: 142,
  theCloneWars: 98,
  episodeIII: 140,
  solo: 142,
  rogueOne: 142,
  episodeIV: 121,
  episodeV: 124,
  episodeVI: 134,
  episodeVII: 136,
  episodeVIII: 152
]


example(of: "startWith") {
  
  let disposeBag = DisposeBag()
  
  let prequelEpisodes = Observable.of(episodeI, episodeII, episodeIII)
  
  let flashback = prequelEpisodes.startWith(episodeIV, episodeV)
  
  flashback
    .subscribe(onNext: { episode in
      print(episode)
    })
    .disposed(by: disposeBag)
}

example(of: "concat") {
  
  let disposeBag = DisposeBag()

  let prequelTrilogy = Observable.of(episodeI, episodeII, episodeIII)
  
  let originalTrilogy = Observable.of(episodeIV, episodeV, episodeVI)
  
  prequelTrilogy.concat(originalTrilogy)
    .subscribe(onNext: { episode in
      print(episode)
    })
    .disposed(by: disposeBag)
}

example(of: "merge") {
  
  let disposeBag = DisposeBag()
  
  let filmTrilogies = PublishSubject<String>()
  
  let standaloneFilms = PublishSubject<String>()
  
  let storyOrder = Observable.of(filmTrilogies, standaloneFilms)
  
  storyOrder.merge()
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)
  
  filmTrilogies.onNext(episodeI)
  filmTrilogies.onNext(episodeII)
  
  standaloneFilms.onNext(theCloneWars)
  
  filmTrilogies.onNext(episodeIII)
  
  standaloneFilms.onNext(solo)
  standaloneFilms.onNext(rogueOne)
  
  filmTrilogies.onNext(episodeIV)
}

example(of: "combineLatest") {
  
  let disposeBag = DisposeBag()

  let characters = Observable.of(luke, hanSolo, leia, chewbacca)
  
  let primaryWeapons = Observable.of(lightsaber, dl44, defender, bowcaster)
  
  Observable.combineLatest(characters, primaryWeapons) { character, weapon in
    "\(character): \(weapon)"
    }
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)
}

example(of: "zip") {
  
  let disposeBag = DisposeBag()
  
  let characters = Observable.of(luke, hanSolo, leia, chewbacca)
  
  let primaryWeapons = Observable.of(lightsaber, dl44, defender, bowcaster)
  
  Observable.zip(characters, primaryWeapons) { character, weapon in
    "\(character): \(weapon)"
    }
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)
}

example(of: "amb") {
  
  let disposeBag = DisposeBag()
  
  let prequelEpisodes = PublishSubject<String>()
  
  let originalEpisodes = PublishSubject<String>()
  
  prequelEpisodes.amb(originalEpisodes)
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)

  originalEpisodes.onNext(episodeIV)
  
  prequelEpisodes.onNext(episodeI)

  prequelEpisodes.onNext(episodeII)
  
  originalEpisodes.onNext(episodeV)
}

example(of: "reduce") {
  
  let disposeBag = DisposeBag()
  
  Observable.from(runtimes.values)
    .reduce(0, accumulator: +)
    .subscribe(onNext: {
      print(stringFrom($0))
    })
    .disposed(by: disposeBag)
}

example(of: "scan") {
  
  let disposeBag = DisposeBag()
  
  Observable.from(runtimes.values)
    .scan(0, accumulator: +)
    .subscribe(onNext: {
      print(stringFrom($0))
    })
    .disposed(by: disposeBag)
}



