//https://www.hackerrank.com/challenges/ctci-ice-cream-parlor/problem
import Foundation

// Complete the whatFlavors function below.
func whatFlavors(cost: [Int], money: Int) -> Void {
  var prices: [Int:Int] = [:]
  for (idx, price) in cost.enumerated() {
    if price < money {
      let otherCost = money - price
      if let otherIdx = prices[otherCost] {
        print("\(min(idx+1, otherIdx+1)) \(max(idx+1,otherIdx+1))")
        return
      }
      prices[price] = idx
    }
  }
}

guard let t = Int((readLine()/*?.trimmingCharacters(in: .whitespacesAndNewlines)*/)!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let money = Int((readLine()/*?.trimmingCharacters(in: .whitespacesAndNewlines)*/)!)
    else { fatalError("Bad input") }

    guard let n = Int((readLine()/*?.trimmingCharacters(in: .whitespacesAndNewlines)*/)!)
    else { fatalError("Bad input") }

    guard let costTemp = readLine() else { fatalError("Bad input") }
    let cost: [Int] = costTemp.split(separator: " ").map {
        if let costItem = Int($0/*.trimmingCharacters(in: .whitespacesAndNewlines)*/) {
            return costItem
        } else { fatalError("Bad input") }
    }

    guard cost.count == n else { fatalError("Bad input") }

    whatFlavors(cost: cost, money: money)
}
