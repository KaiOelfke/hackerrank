//https://www.hackerrank.com/challenges/minimum-swaps-2/problem
import Foundation

// Complete the minimumSwaps function below.
func minimumSwaps(arr: [Int]) -> Int {
  var tmp = arr.map { $0 - 1 }
  var swaps: Int = 0
  var i: Int = 0
  while i < tmp.count {
    if tmp[i] != i {
      tmp.swapAt(i, tmp[i])
      swaps += 1
    } else {
      i += 1
    }
  }
  return swaps
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let res = minimumSwaps(arr: arr)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

/*
var tmp = arr.map { $0 - 1 }
  var swaps: Int = 0
  var sorted: [Int] = Array(repeating: 0, count: arr.count)
  for i in 0..<arr.count {
    sorted[i] = i
  }
  for i in 0..<arr.count {
    let target = tmp[i]
    if target != sorted[i] {
      swaps += 1
      let idx = sorted.index(of: target)!
      sorted.swapAt(i, idx)
    }
  }
  return swaps
*/

/*
guard arr.count > 1 else {return 0}
  var tmp = arr.map { $0 - 1 }
  var swaps: Int = 0
  var sorted: Bool = false
  var diff = tmp.enumerated().map { $0.element - $0.offset }
  while !sorted {
    var highest = diff[0]
    var lowest = diff[0]
    var lowInd = 0
    var highInd = 0
    sorted = true
    for i in 1..<tmp.count {
      if (diff[i] == 1 && diff[i-1] == -1) || (diff[i] == -1 && diff[i-1] == 1) {
        tmp.swapAt(i, i-1)
        swaps += 1
        diff[i] = tmp[i] - i
        diff[i-1] = tmp[i-1] - i + 1
      }
      if diff[i] < lowest {
        lowest = diff[i]
        lowInd = i
      } else if diff[i] > highest {
        highest = diff[i]
        highInd = i
      }
      if sorted && tmp[i] < tmp[i-1] {
        sorted = false
      }
    }
    print("LowInd: \(lowInd) HighInd:\(highInd)")
    if lowest < 0 && highest > 0 {
      if tmp[lowInd] < tmp[highInd] {
        tmp.swapAt(lowInd, highInd)
        diff[lowInd] = tmp[lowInd] - lowInd
        diff[highInd] = tmp[highInd] - highInd
      } else {
        if diff[lowInd] * -1 > diff[highInd] {
          let tmpIdx = tmp[lowInd]
          tmp.swapAt(lowInd, tmpIdx)
          diff[lowInd] = tmp[lowInd] - lowInd
          diff[tmpIdx] = tmp[tmpIdx] - tmpIdx
        } else {
          let tmpIdx = tmp[highInd]
          tmp.swapAt(highInd, tmpIdx)
          diff[lowInd] = tmp[lowInd] - lowInd
          diff[tmpIdx] = tmp[tmpIdx] - tmpIdx
        }
      }
        swaps += 1
    }
    print(tmp)
    print(diff)
  }
  return swaps
*/
