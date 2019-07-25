//https://www.hackerrank.com/challenges/recursive-digit-sum/problem
import Foundation

// Complete the superDigit function below.
func superDigit(n: String, k: Int) -> Int {
  guard n.count != 1 else { return Int(n)! }
  var sum: Int = 0
  for letter in n {
    sum += Int(String(letter))! 
  }
  return superDigit(n: String(sum * k), k: 1)
  
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

let n = nk[0]

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

let result = superDigit(n: n, k: k)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
