//https://www.hackerrank.com/challenges/ctci-big-o/problem
import Foundation

// Complete the primality function below.
func primality(n: Int) -> String {
  if n < 2 {
    return "Not prime"
  }
  if n == 2 || n == 3 || n == 5 || n == 7 {
    return "Prime"
  }
  if n % 2 == 0 {
    return "Not prime"
  }
  if n % 3 == 0 {
     return "Not prime"
  }
  if n % 5 == 0 {
    return "Not prime"
  }
  if n % 7 == 0 {
    return "Not prime"
  }
  var sqrt = Double(n).squareRoot()
  sqrt.round(.up)
  let lim: Int = Int(sqrt)
  for i in stride(from: 11, to: lim+1, by: 2) {
    if n % i == 0 {
      return "Not prime"
    }
  }

  return "Prime"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for pItr in 1...p {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = primality(n: n)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
