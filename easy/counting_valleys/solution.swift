//https://www.hackerrank.com/challenges/counting-valleys/problem
import Foundation

// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    var altitude: Int = 0
    var valleyCount: Int = 0
    for move in s {
        if move == "U" {
            altitude += 1
        } else {
            if altitude == 0 {
                valleyCount += 1
            }
            altitude -= 1
        }
    }
    return valleyCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

let result = countingValleys(n: n, s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
