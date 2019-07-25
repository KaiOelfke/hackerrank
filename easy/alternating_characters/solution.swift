//https://www.hackerrank.com/challenges/alternating-characters/problem
import Foundation

// Complete the alternatingCharacters function below.
func alternatingCharacters(s: String) -> Int {
    var deletions: Int = 0
    var previousCharacter = s.first!
    let suffix = s.suffix(s.count - 1)
    for letter in suffix {
        if previousCharacter == letter {
            deletions += 1
        } else {
            previousCharacter = letter
        }
    }
    return deletions
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = alternatingCharacters(s: s)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
