//https://www.hackerrank.com/challenges/ctci-bubble-sort/problem
import Foundation

// Complete the countSwaps function below.
func countSwaps(a: [Int]) -> Void {
    var arr = a
    var count: Int = 0
    for i in 0..<a.count {
        for j in 0..<(a.count - 1) {
            if arr[j] > arr[j+1] {
                let tmp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tmp
                count += 1
            }
        }
    }
    print("Array is sorted in \(count) swaps.")
    print("First Element: \(arr.first!)")
    print("Last Element: \(arr.last!)")
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

countSwaps(a: a)
