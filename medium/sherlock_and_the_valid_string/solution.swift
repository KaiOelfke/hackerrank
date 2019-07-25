//https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem
import Foundation

// Complete the isValid function below.
func isValid(s: String) -> String {
  var freq: [Character: Int] = [:]
  for letter in s {
    freq[letter] = (freq[letter] ?? 0) + 1
  }

  var allOnes: Bool = true
  var allNotOnes: Bool = true
  var removedOne: Bool = false
  var subtracted: Bool = false
  //var removedOne: Bool = false
  var previousCount: Int? = nil
  //var alternativeCount: Int? = nil
  for count in freq.values {
    if count == 1 {
      if !subtracted {
        subtracted = true
      } else {
        allNotOnes = false
      }
    } else {
      if !removedOne && count - 1 == 1 {
        removedOne = true
      } else {
        allOnes = false
      }
      if previousCount == nil {
        previousCount = count
      } else if previousCount == count {
        continue
      } else if abs(previousCount! - count) == 1 && !subtracted {
        subtracted = true
      } else {
        allNotOnes = false
      }
    }

    if !allNotOnes && !allOnes {
      break
    }
    
    
    /*
    if previousCount == nil {
      if count == 1 && !removedOne {
        removedOne = true
      }
      previousCount = count
    } else if count != 1 && previousCount == 1 && !removedOne {
      //remove one, previousCount == count
      //o. remove one, previousCount bleibt 1
      removedOne = true
      previousCount = count
      alternativeCount = 1
    } else if abs(previousCount! - count) > 2 {
      return "NO"
    } else if abs(previousCount! - count) == 1 {
      if removedOne {
        return "NO"
      }
      removedOne = true
    }*/
  }
  return allOnes || allNotOnes ? "YES" : "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = isValid(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
