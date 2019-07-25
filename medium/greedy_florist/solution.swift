//https://www.hackerrank.com/challenges/greedy-florist/problem
import Foundation

// Complete the getMinimumCost function below.
func getMinimumCost(k: Int, c: [Int]) -> Int {
  let friends = min(k, c.count)
  let sortedCosts = c.sorted(by: { $0 > $1 })
  var sum = 0
  var iteration = 1
  var purchased = 0
  while purchased < c.count {
    let remaining = c.count - purchased
    if remaining >= friends {
      sortedCosts[purchased..<(friends+purchased)].forEach {
        sum += $0 * iteration
      }
      purchased += friends
    } else {
      sortedCosts[purchased..<(purchased+remaining)].forEach {
        sum += $0 * iteration
      }
      purchased += remaining
    }
    iteration += 1
  }
  return sum
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let cTemp = readLine() else { fatalError("Bad input") }
let c: [Int] = cTemp.split(separator: " ").map {
    if let cItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return cItem
    } else { fatalError("Bad input") }
}

guard c.count == n else { fatalError("Bad input") }

let minimumCost = getMinimumCost(k: k, c: c)

fileHandle.write(String(minimumCost).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
