//https://www.hackerrank.com/challenges/ctci-ransom-note/problem
import Foundation

// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    var magWordsCount: [String: Int] = [:]
    for magWord in magazine {
        if magWordsCount[magWord] == nil {
            magWordsCount[magWord] = 1
        } else {
            magWordsCount[magWord] = magWordsCount[magWord]! + 1
        }
    }
    for noteWord in note {
        if let count = magWordsCount[noteWord], count > 0 {
            magWordsCount[noteWord] = magWordsCount[noteWord]! - 1
        } else {
            print("No")
            return
        }
    }
    print("Yes")
}

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let magazineTemp = readLine() else { fatalError("Bad input") }
let magazine: [String] = magazineTemp.split(separator: " ").map {
    String($0)
}

guard magazine.count == m else { fatalError("Bad input") }

guard let noteTemp = readLine() else { fatalError("Bad input") }
let note: [String] = noteTemp.split(separator: " ").map {
    String($0)
}

guard note.count == n else { fatalError("Bad input") }

checkMagazine(magazine: magazine, note: note)
