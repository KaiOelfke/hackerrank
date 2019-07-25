//https://www.hackerrank.com/challenges/2d-array/problem
import Foundation

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
    var currentMax: Int = -64
    for row in 0..<(arr.count - 2) {
        for col in 0..<(arr.count - 2) {
            currentMax = max(currentMax, calcHourglassAt(arr, row, col))
        }
    }
    return currentMax
}

func calcHourglassAt(_ arr: [[Int]], _ row: Int, _ col: Int) -> Int {
    return arr[row][col] + arr[row][col + 1] + arr[row][col + 2] 
    + arr[row+1][col + 1] 
    + arr[row+2][col] + arr[row+2][col + 1] + arr[row+2][col + 2]
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
