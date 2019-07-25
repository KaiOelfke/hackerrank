//https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
import Foundation

// Complete the sherlockAndAnagrams function below.
func sherlockAndAnagrams(s: String) -> Int {
  var frequencies: [String: Int] = [:]
  var count: Int = 0
  for len in 1..<s.count {
    for pos in 0...(s.count-len) {
      let startIdx = s.index(s.startIndex, offsetBy: pos)
      let endIdx = s.index(startIdx, offsetBy: len)
      let substring = s[startIdx..<endIdx]
      let sorted = String(substring.sorted())
      if let val = frequencies[sorted] {
        frequencies[sorted] = val + 1
      } else {
        frequencies[sorted] = 1
      }
    }
    frequencies.forEach { _, value in 
      if value >= 2 {
        count += (value * value - value) / 2
      }
    }
    frequencies = [:]
  }
  return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = sherlockAndAnagrams(s: s)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
