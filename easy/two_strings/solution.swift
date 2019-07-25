//https://www.hackerrank.com/challenges/two-strings/problem
import Foundation

// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {

    var checkedLetters: [Character: Bool] = [:]

    for letter in s1 {
        if checkedLetters[letter] == false {
            continue
        }
        else if s2.contains(letter) {
            return "YES"
        } else {
            checkedLetters[letter] = false
        }
    }
    return "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...q {
    guard let s1 = readLine() else { fatalError("Bad input") }

    guard let s2 = readLine() else { fatalError("Bad input") }

    let result = twoStrings(s1: s1, s2: s2)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
