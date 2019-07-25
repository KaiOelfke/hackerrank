//https://www.hackerrank.com/challenges/new-year-chaos/problem
import Foundation

// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
  var min: Int = 0
  var expecting: Int = 1
  for i in 0..<q.count {
    let diff = q[i] - i - 1
    guard diff <= 2 else {
      print("Too chaotic")
      return
    }
    //print("i:\(i) q[i]:\(q[i]) diff:\(diff)")    
    if diff > 0 {
      min += diff
    }
    if expecting >= q[i] {
      expecting = i+2
    } else if expecting < q[i] && diff <= 0 {
      min += 1
    }
  }
  print(min)
}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let qTemp = readLine() else { fatalError("Bad input") }
    let q: [Int] = qTemp.split(separator: " ").map {
        if let qItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return qItem
        } else { fatalError("Bad input") }
    }

    guard q.count == n else { fatalError("Bad input") }

    minimumBribes(q: q)
}


/*
// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
  var min: Int = 0
  var tmp = Array(repeating: 0, count: q.count)
  for i in 1...q.count {
    tmp[i-1] = i
  }
  for i in 0..<q.count {
    let diff = q[i] - i - 1
    guard diff <= 2 else {
      print("Too chaotic")
      return
    }
    if diff != 0 && q[i] != tmp[i] {
      //let slice = Array(tmp[(i-1)..<q.count])
     
      let idx = tmp.index(of: q[i])!
      if idx - i == 1 {
        tmp.swapAt(idx, idx-1)
        min += 1
      } else if idx - i == 2 {
        tmp.swapAt(idx, idx-1)
        tmp.swapAt(idx-1, idx-2)
        min += 2
      }
    }
    //print("i:\(i) q[i]:\(q[i]) diff:\(diff)")    
    /*
    if diff > 0 {
      min += diff
    }*/
  }
  print(min)
}
*/
