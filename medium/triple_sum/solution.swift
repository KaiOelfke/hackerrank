//https://www.hackerrank.com/challenges/triple-sum/problem
import Foundation

// Complete the triplets function below.
func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
  let aSet = Set(a)
  let bSet = Set(b)
  let cSet = Set(c)
  let aSort = NSArray(array: aSet.sorted())
  //let bSort = bSet.sorted()
  let cSort = NSArray(array: cSet.sorted())
  var triplets = 0
  let aRange = NSMakeRange(0, aSort.count)
  let cRange = NSMakeRange(0, cSort.count)
  let cmp: (Any, Any) -> ComparisonResult = {
    guard let x = $0 as? Int, let y = $1 as? Int else { fatalError("") }
    if x < y {
      return .orderedAscending
    }
    if x > y {
      return .orderedDescending
    }
    return .orderedSame
  }
  for b in bSet {
    let aIdx = aSort.index(of: b, inSortedRange: aRange,
     options: [.insertionIndex, .lastEqual], usingComparator: cmp)
    if aIdx == 0 {
      continue
    }
    let cIdx = cSort.index(of: b, inSortedRange: cRange,
     options: [.insertionIndex, .lastEqual] , usingComparator: cmp)
    triplets += aIdx * cIdx
  }
  return triplets
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let lenaLenbLencTemp = readLine() else { fatalError("Bad input") }
let lenaLenbLenc = lenaLenbLencTemp.split(separator: " ").map{ String($0) }

guard let lena = Int(lenaLenbLenc[0]/*.trimmingCharacters(in: .whitespacesAndNewlines)*/)
else { fatalError("Bad input") }

guard let lenb = Int(lenaLenbLenc[1]/*.trimmingCharacters(in: .whitespacesAndNewlines)*/)
else { fatalError("Bad input") }

guard let lenc = Int(lenaLenbLenc[2]/*.trimmingCharacters(in: .whitespacesAndNewlines)*/)
else { fatalError("Bad input") }

guard let arraTemp = readLine() else { fatalError("Bad input") }
let arra: [Int] = arraTemp.split(separator: " ").map {
    if let arraItem = Int($0/*.trimmingCharacters(in: .whitespacesAndNewlines)*/) {
        return arraItem
    } else { fatalError("Bad input") }
}

guard arra.count == lena else { fatalError("Bad input") }

guard let arrbTemp = readLine() else { fatalError("Bad input") }
let arrb: [Int] = arrbTemp.split(separator: " ").map {
    if let arrbItem = Int($0/*.trimmingCharacters(in: .whitespacesAndNewlines)*/) {
        return arrbItem
    } else { fatalError("Bad input") }
}

guard arrb.count == lenb else { fatalError("Bad input") }

guard let arrcTemp = readLine() else { fatalError("Bad input") }
let arrc: [Int] = arrcTemp.split(separator: " ").map {
    if let arrcItem = Int($0/*.trimmingCharacters(in: .whitespacesAndNewlines)*/) {
        return arrcItem
    } else { fatalError("Bad input") }
}

guard arrc.count == lenc else { fatalError("Bad input") }

let ans = triplets(a: arra, b: arrb, c: arrc)

fileHandle.write(String(ans).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
