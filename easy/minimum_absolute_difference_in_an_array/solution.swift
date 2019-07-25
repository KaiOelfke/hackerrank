//https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem
import Foundation

// Complete the minimumAbsoluteDifference function below.

func minimumAbsoluteDifference(arr: [Int]) -> Int { 
    var currentMin: Int = abs(arr[0] - arr[1])
    let sorted = arr.sorted()  
    for i in 0..<(arr.count-1) {
        let nextPair = abs(sorted[i]-sorted[i+1])
        if currentMin > nextPair {
            currentMin = nextPair
        }
    }
    return currentMin
}
/*
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    var currentMin: Int = abs(arr[0] - arr[1])
    var betterRanges: [CountableClosedRange<Int>] = []

    for number in arr {
        let matches = betterRanges.filter({$0.contains(number)})
        var newMin = currentMin
        for match in matches {
            let originalValue = match.lowerBound + currentMin - 1
            let min = abs(originalValue - number)
            if min < newMin {
                newMin = min
            }
        }
        if newMin == 0 {
            return 0
        }
        betterRanges = betterRanges.map {
            let low = $0.lowerBound + abs(currentMin - newMin)
            let high = $0.upperBound - abs(currentMin - newMin)
            return low...high
        }
        currentMin = newMin
        let newRange: CountableClosedRange<Int> = (number - currentMin + 1)...(number + currentMin - 1)
        betterRanges.append(newRange)
    }
    return currentMin
}
*/
/* 
too much space with high initial abs diff
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    var currentMin: Int = abs(arr[0] - arr[1])
    var betterCandidates: [Int: Int] = [:]
    var betterRanges: [Range<Int>] = []

    for number in arr {
        if let match = betterCandidates[number], match < currentMin {
            currentMin = match
        }
        let newRange = (number - currentMin + 1)...(number + currentMin - 1)
        betterRanges.append(newRange)
        
        for i in (number - currentMin + 1)..<number {
            if let cand = betterCandidates[i], cand < abs(i - number) {
                continue
            } else {
                betterCandidates[i] = abs(i - number)
            }
        }
        for i in number...(number + currentMin - 1) {
            if let cand = betterCandidates[i], cand < abs(i - number) {
                continue
            } else {
                betterCandidates[i] = abs(i - number)
            }
        }
        if currentMin == 0 {
            return 0
        }
    }
    return currentMin

n log n
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    var currentMin: Int = abs(arr[0] - arr[1])
    let sortedArr = arr.sorted()
    var i: Int = 0
    while i < arr.count && currentMin > 0 {
        let low = sortedArr[i] - (currentMin - 1)
        let high = sortedArr[i] + (currentMin - 1)
        let slice = Array(sortedArr[(i+1)..<sortedArr.count])
        if let idx = binarySearch(arr: slice, low: low, high: high) {
            currentMin = abs(sortedArr[i] - slice[idx])
        } else {
            i += 1
        }
    }
    return currentMin
}*/
/*
func binarySearch(arr: [Int], low: Int, high: Int) -> Int? {
    var lowerBound = 0
    var upperBound = arr.count - 1
    let searchRange = low...high
    while lowerBound <= upperBound {
        let slice = Array(arr[lowerBound...upperBound])
        let element = slice[slice.count / 2]
        if searchRange.contains(element) {
            return slice.count / 2
        } else if element > high {
            if upperBound - lowerBound <= 1 {
                upperBound -= 1
            } else {
                upperBound = lowerBound + slice.count / 2
            }
        } else if element < low {
            lowerBound = lowerBound + slice.count / 2
        }
    }
    return nil
}
*/
/* n^2 laufzeit
    for i in 0..<(arr.count-1) {
        for j in (i+1)..<arr.count {
            let tmpAbs = abs(arr[i] - arr[j])
            if tmpAbs < currentMin {
                currentMin = tmpAbs
            }
        }
    }
    */


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

let result = minimumAbsoluteDifference(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
