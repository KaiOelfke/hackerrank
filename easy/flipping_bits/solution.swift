//https://www.hackerrank.com/challenges/flipping-bits/problem

import Foundation

// Complete the flippingBits function below.
func flippingBits(n: Int) -> Int {
  let val = UInt32(n)
  let max = UInt32.max
  let res = max - val
  let intRes = Int(res)
  return intRes
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = flippingBits(n: n)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
