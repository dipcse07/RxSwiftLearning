import Foundation

public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
  action()
}

//MARK: - For Transforming Observables
//public let episodeI = "Episode I - The Phantom Menace"
//public let episodeII = "Episode II - Attack of the Clones"
//public let episodeIII = "Episode III - Revenge of the Sith"
//public let episodeIV = "Episode IV - A New Hope"
//public let episodeV = "Episode V - The Empire Strikes Back"
//public let episodeVI = "Episode VI - Return Of The Jedi"
//public let episodeVII = "Episode VII - The Force Awakens"
//public let episodeVIII = "Episode VIII - The Last Jedi"
//public let episodeIX = "Episode IX"
//
//public let episodes = [episodeI, episodeII, episodeIII, episodeIV, episodeV, episodeVI, episodeVII, episodeVIII, episodeIX]
//
//public extension String {
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

