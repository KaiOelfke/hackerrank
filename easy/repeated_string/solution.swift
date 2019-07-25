//https://www.hackerrank.com/challenges/repeated-string/problem
import Foundation

// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    let length: Int = s.count
    let countOfA: Int = s.filter({ $0 == "a" }).count
    guard n > length else {
        return s.prefix(n).filter({ $0 == "a" }).count
    }
    let completeStrings: Int = n / length
    let completeStringCountOfA: Int = completeStrings * countOfA
    let remainingStringCountOfA: Int = s.prefix(n - length * completeStrings).filter({ $0 == "a" }).count
    return completeStringCountOfA + remainingStringCountOfA

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
