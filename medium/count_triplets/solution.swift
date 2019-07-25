//https://www.hackerrank.com/challenges/count-triplets-1/problem
import Foundation

// Complete the countTriplets function below.
func countTriplets(arr: [Int], r: Int) -> Int {
  guard r <= 1000 else { return 0 }

  var candidates: [Int: Int] = Dictionary(minimumCapacity: arr.count)
  var numCount: [Int: Int] = Dictionary(minimumCapacity: arr.count)
  var triplets: Int = 0

  for num in arr {
    if num % (r * r) == 0 {
      triplets += candidates[num] ?? 0
    }
    if num % r == 0 {
      let last = num * r
      candidates[last] = (candidates[last] ?? 0) + (numCount[num / r] ?? 0)
    }
    numCount[num] = (numCount[num] ?? 0) + 1
  }
  return triplets 
/*
  for num in arr {
    count[num] = (count[num] ?? 0) + 1
  }

  var tripletCount: Int = 0 
  for num in arr {
    var multiple: Int64 = Int64(num) * Int64(r)
    if multiple > 1000000000 {
      continue
    }
    if var variants = count[Int(multiple)], variants > 0 {
      multiple *= Int64(r)
      if multiple > 1000000000 {
        continue
      }
      if let moreVariants = count[Int(multiple)], moreVariants > 0 {
        variants *= moreVariants
        tripletCount += variants
      }
    }
  }
  return tripletCount
  */
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let nr = nrTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nr[0])
else { fatalError("Bad input") }

guard let r = Int(nr[1])
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let ans = countTriplets(arr: arr, r: r)

fileHandle.write(String(ans).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
