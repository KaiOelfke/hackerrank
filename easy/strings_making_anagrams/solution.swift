//https://www.hackerrank.com/challenges/ctci-making-anagrams/problem
import Foundation

// Complete the makeAnagram function below.
func makeAnagram(a: String, b: String) -> Int {
    var letterCountA: [Character: Int] = [:]
    var letterCountB: [Character: Int] = [:]
    for letter in a {
        if letterCountA[letter] == nil {
            letterCountA[letter] = 1
        } else {
            letterCountA[letter] = letterCountA[letter]! + 1
        }
    }

    for letter in b {
        if letterCountB[letter] == nil {
            letterCountB[letter] = 1
        } else {
            letterCountB[letter] = letterCountB[letter]! + 1
        }
    }
    var deletions: Int = 0
    for letter in "abcdefghijklmnopqrstuvwxyz" {
        let countA = letterCountA[letter] ?? 0
        let countB = letterCountB[letter] ?? 0
        deletions += abs(countA - countB) 
    }
    return deletions
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let a = readLine() else { fatalError("Bad input") }

guard let b = readLine() else { fatalError("Bad input") }

let res = makeAnagram(a: a, b: b)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
