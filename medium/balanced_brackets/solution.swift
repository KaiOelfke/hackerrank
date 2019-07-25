//https://www.hackerrank.com/challenges/balanced-brackets/problem
import Foundation

struct Stack<Element> {
  fileprivate var array: [Element] = []
  
  mutating func push(_ element: Element) {
    array.append(element)
  }
  
  mutating func pop() -> Element? {
    return array.popLast()
  }
  
  func peek() -> Element? {
    return array.last
  }
}

// Complete the isBalanced function below.
func isBalanced(s: String) -> String {
    var bracketStack: Stack<Character> = Stack<Character>()
    for bracket in s {
        if bracket == "(" || bracket == "[" || bracket == "{" {
            bracketStack.push(bracket)
        } else {
            guard let match = bracketStack.pop() else { return "NO" }
            if  match == "(" && bracket != ")" ||
                match == "[" && bracket != "]" ||
                match == "{" && bracket != "}" {
                    return "NO"
                }
        }
    }
    if let _ = bracketStack.peek() {
        return "NO"
    }
    return "YES"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = isBalanced(s: s)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
